import SpriteKit

extension ActionController {
    func actionMoveGameStateGame(moveVector: CGVector) {
        if world.player.state == .Idle || world.player.state == .Walking {
            if !moveVector.isZeroVector {
                world.player.move(direction: moveVector)
            }
        }
    }

    func actionPrimaryGameStateGame() {
        let currentGameArea = world.getCurrentGameArea()

        // TODO: Need to fix this to using mapPoint occupation
        let buildings = currentGameArea.buildings.filter({$0.contains(world.player.getPositionInFront())})

        if let buildingInFront = buildings.first {
            switch buildingInFront.type {
            case .Teleport:
                world.teleport(to: buildingInFront.teleport!)
                cameraController.fadeScreen()
            case .Bed:
                let cmdEndDay  = CmdEndDay(world: world)
                cmdEndDay.execute()

                let cmdStartDay = CmdStartDay(world: world)
                cmdStartDay.execute()
                cameraController.fadeScreen()
            case .Crop:
                if buildingInFront.canHarvest {
                    let cmdHarvest = CmdActionHarvest(world: world, crop: buildingInFront)
                    cmdHarvest.execute()
                }
            case .Sign:
                changeGameState(to: .Dialog)
            case .VendingMachine:
                changeGameState(to: .Store)
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
        world.hudInterfaceData.changeHotBarCursorPosition(-1)
    }

    func actionSwitchRightGameStateGame() {
        world.hudInterfaceData.changeHotBarCursorPosition(1)
    }
}
