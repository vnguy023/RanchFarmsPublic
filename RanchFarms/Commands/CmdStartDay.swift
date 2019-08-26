class CmdStartDay: Command {
    let world: World

    init(world: World) {
        self.world = world
    }

    func execute() {
        world.teleport(to: world.teleportStartDay)
    }
}
