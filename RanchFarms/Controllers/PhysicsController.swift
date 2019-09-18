import SpriteKit

class PhysicsController {
    let world: World!

    init(world: World) {
        self.world = world
    }

    func update() {
        updateMovement()
    }

    private func updateMovement() {
        var persons = [Person]()
        persons.append((world.player))

        for person in persons {
            person.actionMove()
        }
    }

}
