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
            if person.velocity.isZeroVector {
                continue
            }

            let oldVelocity = person.velocity

            // do x first
            person.velocity = CGVector(dx: oldVelocity.dx, dy: 0)
            let collisionBoundaryX = getCollisionBoundary(boundary: person.getBoundary(newPosition: person.getNewPosition()))
            if objectsIntersect(gameObject: person, collisonBoundary: collisionBoundaryX).isEmpty {
                person.actionMove()
            }

            // do y
            person.velocity = CGVector(dx: 0, dy: oldVelocity.dy)
            let collisionBoundaryY = getCollisionBoundary(boundary: person.getBoundary(newPosition: person.getNewPosition()))
            if objectsIntersect(gameObject: person, collisonBoundary: collisionBoundaryY).isEmpty {
                person.actionMove()
            }
        }
    }

    private func objectsIntersect(gameObject: GameObject, collisonBoundary: CGRect) -> [GameObject] {
        var objectsToTest = [GameObject]()
        objectsToTest.append(world.player)

        if let gameArea = world.gameAreas[gameObject.location] {
            //gameArea.tiles.forEach({objectsToTest.append($0)})
            //gameArea.terrains.forEach({objectsToTest.append($0)})
            gameArea.buildings.forEach({objectsToTest.append($0)})
        }

        var result = [GameObject]()

        for object in objectsToTest.filter({$0 !== gameObject}) {
            if getCollisionBoundary(boundary: object.getBoundary()).intersects(collisonBoundary) {
                result.append(object)
            }
        }

        return result
    }

    private func getCollisionBoundary(boundary: CGRect) -> CGRect {
        var result = boundary
        result.origin.x += 2
        result.origin.y += 2
        result.size.width -= 4
        result.size.height -= 4
        return result
    }
}
