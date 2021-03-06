import SpriteKit

class ActionControllerGame {
    let scene: GameScene
    let world: World

    let cameraController: CameraController!
    let eventController: EventController!
    let inputController: InputController!
    let hudController: HudControllerGame!
    let hudInterfaceData: HudInterfaceDataGame!

    var handlePause: (()->())!
    var handleUnpause: (()->())!

    init(scene: GameScene, world: World, cameraController: CameraController, eventController: EventController, hudController: HudControllerGame, inputController: InputController, hudInterfaceDataGame: HudInterfaceDataGame) {
        self.scene = scene
        self.world = world

        self.cameraController = cameraController
        self.eventController = eventController
        self.hudController = hudController
        self.hudInterfaceData = hudInterfaceDataGame
        self.inputController = inputController

        assignActionsGameStateGame() //Hack to start off with something
        changeState(to: .Game)
    }

    func changeState(to state: HudInterfaceDataGame.State) {
        if hudInterfaceData.state == state {
            return
        }

        hudInterfaceData.state = state

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
            hudInterfaceData.storeCursor = CGPoint(x: 0, y: 2)
            assignActionsGameStateStore()
            if handlePause != nil { handlePause() }
        default:
            print ("[ActionControllerGameScene] [Desc=new actions not assigned] [State=\(state)]")
        }
    }

    func executeGameEvent(_ gameEvent: GameEvent) {
        switch gameEvent.type {
        case .Dialog:
            if let dialog = DialogManager.shared.getDialog(dialogId: gameEvent.dialogId) {
                hudInterfaceData.dialog = dialog
                hudInterfaceData.currentDialogSectionIndex = 0
                hudInterfaceData.currentDialogOptionIndex = 0
                changeState(to: .Dialog)

                world.memoryBank.recordSeen(dialogId: dialog.id)
            }
        case .Store:
            hudInterfaceData.store = Store(storeFrontId: gameEvent.storeFrontId,
                                           storeCatalogId: gameEvent.storeCatalogId)
            changeState(to: .Store)
        case .Sleep:
            scene.vc.loadEndDayScene(world: world)
            return
        case .Teleport:
            world.teleport(to: gameEvent.teleportId)
            cameraController.fadeScreen()
            changeState(to: .Game)
        }

        world.memoryBank.recordSeen(gameEventId: gameEvent.id)
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
