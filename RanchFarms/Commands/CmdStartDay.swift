class CmdStartDay: Command {
    let world: World

    init(world: World) {
        self.world = world
    }

    func execute() {
        world.teleport(to: world.teleportStartDay)

        world.player.location = world.player.location
        world.player.previousPosition = world.player.position

        world.gameTicksElapsedToday = Config.GameTicksPerGameHour * 6 // Start at 6AM
    }
}
