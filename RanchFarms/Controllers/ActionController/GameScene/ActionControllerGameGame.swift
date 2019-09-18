import SpriteKit

extension ActionControllerGame {
    func actionMoveGameStateGame(moveVector: CGVector) {
        if world.player.state == .Idle || world.player.state == .Walking {
            if !moveVector.isZeroVector {
                world.player.velocity = moveVector.scale(world.player.moveSpeed)
            }
        }
    }

    func actionPrimaryGameStateGame() {
        let currentGameArea = world.getCurrentGameArea()

        let buildingsInFront = currentGameArea.buildings.filter({$0.boundaryContains(point: world.player.getPositionInFront())})

        for buildingInFront in buildingsInFront {
            switch buildingInFront.type {
            case .Teleport:
                world.teleport(to: buildingInFront.buildingInfo.teleportId!)
                cameraController.fadeScreen()
                return
            case .Bed:
                let cmdEndDay  = CmdEndDay(world: world)
                cmdEndDay.execute()

                let cmdStartDay = CmdStartDay(world: world)
                cmdStartDay.execute()
                cameraController.fadeScreen()
                return
            case .Crop:
                if buildingInFront.canHarvest {
                    let cmdHarvest = CmdActionHarvest(world: world, crop: buildingInFront)
                    cmdHarvest.execute()
                }
                return
            case .Sign:
                changeState(to: .Dialog)
                return
            case .VendingMachine:
                changeState(to: .Store)
                return
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
        world.hudInterfaceData.changeHotBarCursorPosition(CGVector(dx: -1, dy: 0))
    }

    func actionSwitchRightGameStateGame() {
        world.hudInterfaceData.changeHotBarCursorPosition(CGVector(dx: 1, dy: 0))
    }
}
