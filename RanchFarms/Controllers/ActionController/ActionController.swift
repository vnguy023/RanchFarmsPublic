import SpriteKit

class ActionController {
    let world: World!

    let cameraController: CameraController!
    let inputController: InputController!
    let hudController: HudController!

    init(world: World, cameraController: CameraController, hudController: HudController, inputController: InputController) {
        self.world = world

        self.cameraController = cameraController
        self.hudController = hudController
        self.inputController = inputController

        changeGameState(to: .Game)
    }

    func changeGameState(to gameState: HudInterfaceData.GameState) {
        if world.hudInterfaceData.gameState == gameState {
            return
        }

        world.hudInterfaceData.gameState = gameState

        switch gameState {
        case .Game:
            assignActionsGameStateGame()
        case .Inventory:
            assignActionsGameStateInventory()
        default:
            print ("[Desc=newActions not assigned] [GameState=\(gameState)]")
        }
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
}
