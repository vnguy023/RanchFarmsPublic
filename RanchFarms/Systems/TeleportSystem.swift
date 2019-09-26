import SpriteKit

class TeleportSystem {
    let world: World!
    let cameraController: CameraController!

    // TODO: put in a limiter - Controls how often we update this

    init(world: World, cameraController: CameraController) {
        self.world = world
        self.cameraController = cameraController
    }

    func update() {
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
