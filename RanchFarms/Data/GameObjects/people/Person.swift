import SpriteKit

class Person: GameObject {
    let id: PersonId

    enum State {
        case Idle
        case Walking

        // Use Tools
        case Axeing
        case Hoeing
        case Mining
        case Watering
    }

    var state = State.Idle

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

    func getNewPosition() -> CGPoint {
        return position + velocity
    }

    func actionMove() {
        if !velocity.isZeroVector {
            if state == .Idle {
                setNewState(state: .Walking)
            }

            let initPosition = position
            position = getNewPosition()

            faceDirection = CGVector.getDirection4(start: initPosition, end: position)
            velocity = CGVector()
        }
    }

    func setNewState(state: State) {
        self.state = state
        stateDurationElapsed = 0
    }

    func canUseTool() -> Bool {
        if state == .Idle || state == .Walking {
            return true
        }

        return false
    }
}
