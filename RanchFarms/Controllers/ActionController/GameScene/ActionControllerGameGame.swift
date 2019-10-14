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
        let npcsInFront = world.npcs.filter({$0.boundaryContains(point: world.player.getPositionInFront())})

        for npc in npcsInFront{
            let gameEvents = GameEventManager.shared.getGameEventsTriggered(personId: npc.id, actionType: .Interact)
            for gameEvent in gameEvents{
                let cmd = CmdValidateRequirements(requirements: gameEvent.requirements, world: world, person: npc)
                cmd.execute()

                if cmd.success {
                    executeGameEvent(gameEvent)
                    return
                }
            }
        }

        for buildingInFront in buildingsInFront {
            let gameEvents = GameEventManager.shared.getGameEventsTriggered(buildingId: buildingInFront.id, actionType: .Interact)
            for gameEvent in gameEvents{
                let cmd = CmdValidateRequirements(requirements: gameEvent.requirements, world: world, person: nil)
                cmd.execute()

                if cmd.success {
                    executeGameEvent(gameEvent)
                    return
                }
            }

            switch buildingInFront.type {
            case .Crop:
                if buildingInFront.canHarvest {
                    let cmdHarvest = CmdActionHarvest(world: world, crop: buildingInFront)
                    cmdHarvest.execute()

                    if cmdHarvest.success {
                        eventController.notify(event: EventReceiveItem(item: cmdHarvest.itemReceived))
                    }

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
        let cmdActionUseItem  = CmdActionUseItem(world: world, hudInterfaceData: hudInterfaceData)
        cmdActionUseItem.execute()
    }

    func actionSwitchLeftGameStateGame() {
        hudInterfaceData.changeHotBarCursorPosition(CGVector(dx: -1, dy: 0))
    }

    func actionSwitchRightGameStateGame() {
        hudInterfaceData.changeHotBarCursorPosition(CGVector(dx: 1, dy: 0))
    }
}
