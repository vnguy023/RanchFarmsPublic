import SpriteKit

extension ActionControllerGame {
    func actionMoveGameStateGame(moveVector: CGVector) {
        if world.player.state == .Idle || world.player.state == .Walking {
            if !moveVector.isZeroVector {
                world.player.move(direction: moveVector)
            }
        }
    }

    func actionPrimaryGameStateGame() {
        let currentGameArea = world.getCurrentGameArea()

        let buildings = currentGameArea.buildings.filter({$0.boundaryContains(point: world.player.getPositionInFront())})

        if let buildingInFront = buildings.first {
            switch buildingInFront.type {
            case .Teleport:
                world.teleport(to: buildingInFront.buildingInfo.teleportId!)
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
                changeState(to: .Dialog)
            case .VendingMachine:
                changeState(to: .Store)
            default:
                print ("[Desc=Primary Action not handled for this building] [BuildingType=\(buildingInFront.type)]")
            }
        }
    }

    func actionMenuGameStateGame() {
        changeState(to: .Inventory)
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
