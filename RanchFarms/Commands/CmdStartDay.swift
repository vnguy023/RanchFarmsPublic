class CmdStartDay: Command {
    let world: World

    init(world: World) {
        self.world = world
    }

    func execute() {
        world.teleport(to: world.teleportStartDay)

        world.player.previousPosition = world.player.position

        world.gameTicksElapsedToday = Config.GameTicksPerGameHour * 6 // Start at 6AM

        for npc in world.npcs {
            npc.schedule = ScheduleManager.shared.getScheduleFor(npc: npc, world: world)
        }

        for gameArea in world.gameAreas {
            for crop in gameArea.value.buildings.filter({$0.type == .Crop}) {
                world.add(terrain: Terrain(player: crop.player, terrainType: .Tilled, mapPoint: crop.mapPoint))
            }
        }
    }
}
