import SpriteKit

class ActionController {
    let world: World!

    let inputController: InputController!
    let hudController: HudController!

    init(world: World,  hudController: HudController, inputController: InputController) {
        self.world = world

        self.hudController = hudController
        self.inputController = inputController

        changeGameState(to: .Game)
    }

    // GameState.Game
    ///////////////////////

    func actionMoveGameStateGame(moveVector: CGVector) {
        if !moveVector.isZeroVector {
            let initPosition = world.player.position
            world.player.position = world.player.position + moveVector.scale(world.player.moveSpeed)
            world.player.faceDirection = CGVector.getDirection4(start: initPosition, end: world.player.position)
        }
    }

    func actionPrimaryGameStateGame() {
        let currentGameArea = world.getCurrentGameArea()

        let buildings = currentGameArea.buildings.filter({$0.contains(world.player.getPositionInFront())})

        if let teleport = buildings.filter({$0.type == .Teleport}).first {
            world.teleport(to: teleport.teleport!)
        } else if let _ = buildings.filter({$0.type == .Bed}).first {
            let cmdEndDay  = CmdEndDay(world: world)
            cmdEndDay.execute()

            let cmdStartDay = CmdStartDay(world: world)
            cmdStartDay.execute()
        }
    }

    func actionMenuGameStateGame() {
        changeGameState(to: .Inventory)
    }

    func actionUseGameStateGame() {
        let cmdActionUseItem  = CmdActionUseItem(world: world)
        cmdActionUseItem.execute()
    }

    func actionSwitchLeftGameStateGame() {
        world.hudInterfaceData.changeHotBarIndexLeft()
    }

    func actionSwitchRightGameStateGame() {
        world.hudInterfaceData.changeHotBarIndexRight()
    }

    // GameState.Inventory
    ///////////////////////

    func actionCancelGameStateInventory() {
        changeGameState(to: .Game)
    }

    func actionDPadLeftGameStateInventory() {
        world.hudInterfaceData.changeInventoryIndexLeft()
    }

    func actionDPadRightGameStateInventory() {
        world.hudInterfaceData.changeInventoryIndexRight()
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
        
        inputController.handleCancel[.ClickDown] = actionCancelGameStateInventory

        inputController.handleDPadLeft[.ClickDown] = actionDPadLeftGameStateInventory
        inputController.handleDPadRight[.ClickDown] = actionDPadRightGameStateInventory
    }
}
