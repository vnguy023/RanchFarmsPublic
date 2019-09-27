import SpriteKit

class TeleportSystem: BaseSystem {
    let world: World!
    let cameraController: CameraController!

    init(world: World, cameraController: CameraController) {
        self.world = world
        self.cameraController = cameraController

        super.init(updateTickInterval: Config.teleportSystemUpdateInterval)
    }

    override func process() {
        var people = [Person]() // only do player for now
        people.append(world.player)
        for person in people {
            let teleportEvents = GameEventManager.shared.getGameEventsTriggered(boundary: person.getBoundary(), location: person.location)

            // TODO: add requirement validation checking
            for gameEvent in teleportEvents {
                world.teleport(to: gameEvent.teleportId)
                cameraController.fadeScreen()
                break
            }
        }
    }
}
