import SpriteKit

extension ActionController {
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
}
