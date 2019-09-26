import SpriteKit

class ActionControllerGame {
    let world: World!

    let cameraController: CameraController!
    let inputController: InputController!
    let hudController: HudControllerGame!

    var handlePause: (()->())!
    var handleUnpause: (()->())!

    init(world: World, cameraController: CameraController, hudController: HudControllerGame, inputController: InputController) {
        self.world = world

        self.cameraController = cameraController
        self.hudController = hudController
        self.inputController = inputController

        changeState(to: .Game)
    }

    func changeState(to state: HudInterfaceDataGame.State) {
        if world.hudInterfaceData.state == state {
            return
        }

        world.hudInterfaceData.state = state

        switch state {
        case .Dialog:
            assignActionsGameStateDialog()
            if handlePause != nil { handlePause() }
        case .Game:
            assignActionsGameStateGame()
            if handlePause != nil { handleUnpause() }
        case .Inventory:
            assignActionsGameStateInventory()
            if handlePause != nil { handlePause() }
        case .Store:
            world.hudInterfaceData.storeCursor = CGPoint(x: 0, y: 2)
            assignActionsGameStateStore()
            if handlePause != nil { handlePause() }
        default:
            print ("[ActionControllerGameScene] [Desc=new actions not assigned] [State=\(state)]")
        }
    }

    func executeGameEvent(_ gameEvent: GameEvent) {
        switch gameEvent.type {
        case .Dialog:
            changeState(to: .Dialog)
        case .Store:
            world.hudInterfaceData.store = Store(storeFrontId: gameEvent.storeFrontId,
                                                 storeCatalogId: gameEvent.storeCatalogId)
            changeState(to: .Store)
        case .Teleport:
            world.teleport(to: gameEvent.teleportId!)
            cameraController.fadeScreen()
        }
    }

    private func assignActionsGameStateDialog() {
        inputController.clearHandles()

        inputController.handlePrimary[.ClickDown] = actionPrimaryGameStateDialog
        inputController.handleCancel[.ClickDown] = actionCancelGameStateDialog

        inputController.handleDPadUp[.ClickDown] = actionDPadUpGameStateDialog
        inputController.handleDPadDown[.ClickDown] = actionDPadDownGameStateDialog
        inputController.handleDPadLeft[.ClickDown] = actionDPadLeftGameStateDialog
        inputController.handleDPadRight[.ClickDown] = actionDPadRightGameStateDialog
    }

    private func assignActionsGameStateGame() {
        inputController.clearHandles()

        inputController.handleMove = actionMoveGameStateGame
        inputController.handlePrimary[.ClickDown] = actionPrimaryGameStateGame
        inputController.handleMenu[.ClickDown] = actionMenuGameStateGame
        inputController.handleUse[.ClickDown] = actionUseGameStateGame

        inputController.handleSwitchLeft[.ClickDown] = actionSwitchLeftGameStateGame
        inputController.handleSwitchRight[.ClickDown] = actionSwitchRightGameStateGame
    }

    private func assignActionsGameStateInventory() {
        inputController.clearHandles()

        inputController.handlePrimary[.ClickDown] = actionPrimaryGameStateInventory
        inputController.handleCancel[.ClickDown] = actionCancelGameStateInventory

        inputController.handleDPadUp[.ClickDown] = actionDPadUpGameStateInventory
        inputController.handleDPadDown[.ClickDown] = actionDPadDownGameStateInventory
        inputController.handleDPadLeft[.ClickDown] = actionDPadLeftGameStateInventory
        inputController.handleDPadRight[.ClickDown] = actionDPadRightGameStateInventory
    }

    private func assignActionsGameStateStore() {
        inputController.clearHandles()

        inputController.handlePrimary[.ClickDown] = actionPrimaryGameStateStore
        inputController.handleUse[.ClickDown] = actionUseGameStateStore
        inputController.handleMenu[.ClickDown] = actionMenuGameStateStore
        inputController.handleCancel[.ClickDown] = actionCancelGameStateStore

        inputController.handleDPadUp[.ClickDown] = actionDPadUpGameStateStore
        inputController.handleDPadDown[.ClickDown] = actionDPadDownGameStateStore
        inputController.handleDPadLeft[.ClickDown] = actionDPadLeftGameStateStore
        inputController.handleDPadRight[.ClickDown] = actionDPadRightGameStateStore
    }
}
