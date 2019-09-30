import SpriteKit

class NPCScheduleSystem: BaseSystem {
    let world: World!

    init(world: World) {
        self.world = world

        super.init(updateTickInterval: Config.teleportSystemUpdateInterval)
    }

    override func process() {
        for npc in world.npcs {
            if let currentEvent = npc.schedule?.getCurrentEvent(currentTime: world.gameTicksElapsedToday) {
                if npc.mapPoint != currentEvent.destination
                    || npc.faceDirection != currentEvent.faceDirection
                    || npc.state != currentEvent.stateAtDestination {
                    if currentEvent.teleport || true {
                        npc.mapPoint = currentEvent.destination
                        npc.faceDirection = currentEvent.faceDirection
                        npc.state = currentEvent.stateAtDestination
                    } else {
                        // TODO: implement pathfinding and have npc move their automatically
                    }
                }

            } else {
                if npc.schedule == nil {
                    print ("[NPCScheduleSystem] [Desc=No schedule assigned] [npcId=\(npc.id)] ")
                } else {
                    print ("[NPCScheduleSystem] [Desc=No scheduleEvents for this schedule] [npcId=\(npc.id)] [scheduleId: \(npc.schedule!.id)]")
                }
            }
        }
    }
}
