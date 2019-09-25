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

            // TODO: Fix this hack because we should be testing against each MapPoint for building,terrain,tile
            //       Currently don't have ability to pull allObjects on a mapPoint yet, due to adjustable boundaryObjectSize

            // do x first
            person.velocity = CGVector(dx: oldVelocity.dx, dy: 0)
            var collisionBoundary = getCollisionBoundary(boundary: person.getBoundary(newPosition: person.getNewPosition()))
            var objectsIntersecting = objectsIntersect(gameObject: person, collisonBoundary: collisionBoundary)
            var mapPointsToTest = objectsIntersecting.compactMap({ return $0.mapPoint })

            var canMove = true
            if !objectsIntersecting.filter({($0 is Building) && $0.isBlocking}).isEmpty {
                canMove = false
            }

            for mapPoint in mapPointsToTest {
                let terrains = objectsIntersecting.filter({($0 is Terrain) && $0.mapPoint == mapPoint})
                let tiles = objectsIntersecting.filter({($0 is Tile) && $0.mapPoint == mapPoint})

                if !terrains.filter({$0.isBlocking}).isEmpty {
                    canMove = false
                    break
                } else if !terrains.filter({!$0.isBlocking}).isEmpty {
                    // TODO: Think about splitting into different logic to test for is walkable
                    continue
                }

                if !tiles.filter({$0.isBlocking}).isEmpty {
                    canMove = false
                    break
                }
            }
            if canMove {
                person.actionMove()
            }

            // do y
            person.velocity = CGVector(dx: 0, dy: oldVelocity.dy)
            collisionBoundary = getCollisionBoundary(boundary: person.getBoundary(newPosition: person.getNewPosition()))
            objectsIntersecting = objectsIntersect(gameObject: person, collisonBoundary: collisionBoundary)
            mapPointsToTest = objectsIntersecting.compactMap({ return $0.mapPoint })

            canMove = true
            if !objectsIntersecting.filter({($0 is Building) && $0.isBlocking}).isEmpty {
                canMove = false
            }

            for mapPoint in mapPointsToTest {
                let terrains = objectsIntersecting.filter({($0 is Terrain) && $0.mapPoint == mapPoint})
                let tiles = objectsIntersecting.filter({($0 is Tile) && $0.mapPoint == mapPoint})

                if !terrains.filter({$0.isBlocking}).isEmpty {
                    canMove = false
                    break
                } else if !terrains.filter({!$0.isBlocking}).isEmpty {
                    // TODO: Think about splitting into different logic to test for is walkable
                    continue
                }

                if !tiles.filter({$0.isBlocking}).isEmpty {
                    canMove = false
                    break
                }
            }
            if canMove {
                person.actionMove()
            }
        }
    }

    private func canMoveBy(velocity: CGVector) {

    }

    private func objectsIntersect(gameObject: GameObject, collisonBoundary: CGRect) -> [GameObject] {
        var objectsToTest = [GameObject]()
        objectsToTest.append(world.player)

        if let gameArea = world.gameAreas[gameObject.location] {
            gameArea.tiles.forEach({objectsToTest.append($0)})
            gameArea.terrains.forEach({objectsToTest.append($0)})
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
