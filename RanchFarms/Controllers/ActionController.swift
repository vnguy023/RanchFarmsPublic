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

        if let buildingInFront = buildings.first {
            switch buildingInFront.type {
            case .Teleport:
                world.teleport(to: buildingInFront.teleport!)
            case .Bed:
                let cmdEndDay  = CmdEndDay(world: world)
                cmdEndDay.execute()

                let cmdStartDay = CmdStartDay(world: world)
                cmdStartDay.execute()
            case .Crop:
                if buildingInFront.canHarvest {
                    print("[Desc=yay Harvest me somehow] [name=\(buildingInFront.buildingInfo.name)]")
                }
            default:
                print ("[Desc=Primary Action not handled for this building] [BuildingType=\(buildingInFront.type)]")
            }
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

    func actionPrimaryGameStateInventory() {
        // just keep reassigning for now
        if world.hudInterfaceData.selectedItemInventoryIndex == nil {
            world.hudInterfaceData.selectedItemInventoryIndex = world.hudInterfaceData.highlightedItemInventoryIndex
        }
    }

    func actionCancelGameStateInventory() {
        if world.hudInterfaceData.selectedItemInventoryIndex != nil {
            world.hudInterfaceData.selectedItemInventoryIndex = nil
        } else {
            changeGameState(to: .Game)
        }
    }

    func actionDPadUpGameStateInventory() {
        world.hudInterfaceData.changeInventoryIndexUp()
    }

    func actionDPadDownGameStateInventory() {
        world.hudInterfaceData.changeInventoryIndexDown()
    }

    func actionDPadLeftGameStateInventory() {
        world.hudInterfaceData.changeInventoryIndexLeft()
    }

    func actionDPadRightGameStateInventory() {
        world.hudInterfaceData.changeInventoryIndexRight()
    }

    // Change of GameStates and assigning of Actions to controller
    ///////////////////////

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
