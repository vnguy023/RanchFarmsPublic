import SpriteKit

class Person: GameObject {
    let type: PersonType

    enum State {
        case Idle
    }

    var state = State.Idle

    init(mapPoint: MapPoint, personType: PersonType) {
        self.type = personType
        super.init(mapPoint: mapPoint)

        self.zPosition = 500
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
