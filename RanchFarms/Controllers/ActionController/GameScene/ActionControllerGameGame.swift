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
            if let gameEventId = buildingInFront.buildingInfo.gameEventId,
                let gameEvent = GameEventManager.shared.getGameEvent(gameEventId: gameEventId) {
                switch gameEvent.type {
                case .Dialog:
                    changeState(to: .Dialog)
                    return
                case .Store:
                    world.hudInterfaceData.store = Store(storeFrontId: gameEvent.storeFrontId,
                                                         storeCatalogId: gameEvent.storeCatalogId)
                    changeState(to: .Store)
                    return
                case .Teleport:
                    world.teleport(to: gameEvent.teleportId!)
                    cameraController.fadeScreen()
                    return
                }
            }

            switch buildingInFront.type {
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
                    return
                } else {
                    if buildingInFront.sfxApplied == nil {
                        buildingInFront.sfxApplied = .Spin
                    }
                }
            default:
                print ("[Desc=Primary Action not handled for this building] [BuildingId=\(buildingInFront.id)] [BuildingType=\(buildingInFront.type)]")
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
