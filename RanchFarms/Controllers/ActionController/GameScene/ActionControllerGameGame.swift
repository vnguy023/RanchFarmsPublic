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
            let gameEvents = GameEventManager.shared.getGameEventsTriggered(buildingId: buildingInFront.id, actionType: .Interact)
            for gameEvent in gameEvents{
                let cmd = CmdValidateRequirements(requirements: gameEvent.requirements,
                                                  currentTime: world.gameTicksElapsedToday)
                cmd.execute()

                if cmd.success {
                    executeGameEvent(gameEvent)
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
