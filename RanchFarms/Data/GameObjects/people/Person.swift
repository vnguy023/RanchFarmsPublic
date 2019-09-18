import SpriteKit

class Person: GameObject {
    let id: PersonId

    enum State {
        case Idle
        case Walking
    }

    var state = State.Idle
    var stateDurationElapsed = Int(0) // GameTicks since we stateChanged

    var previousLocation = Location.House
    var previousPosition = CGPoint()

    var velocity = CGVector()

    override var zOffset: CGFloat { return 2000 }

    init(personId: PersonId, mapPoint: MapPoint) {
        self.id = personId
        super.init(player: .PlayerOne, mapPoint: mapPoint)
    }

    convenience init(data: PersonData) {
        self.init(personId: data.personId, mapPoint: MapPoint(x: 0, y: 0, location: .House))
        self.money = data.money
        self.inventory = Inventory(data: data.inventory)
    }

    func getPersonData() -> PersonData {
        return PersonData(personId: self.id, money: self.money, inventory: inventory.getInventoryData())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func actionMove() {
        if !velocity.isZeroVector {
            if state == .Idle {
                state = .Walking
                stateDurationElapsed = 0
            }

            let initPosition = position
            position = position + velocity

            faceDirection = CGVector.getDirection4(start: initPosition, end: position)
            velocity = CGVector()
        }
    }
}
