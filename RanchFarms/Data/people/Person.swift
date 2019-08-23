import SpriteKit

class Person: GameObject {
    let type: PersonType

    enum State {
        case Idle
    }

    var state = State.Idle

    init(position: CGPoint, location: Location, personType: PersonType) {
        self.type = personType
        super.init(position: position, location: location)

        self.texture = SKTexture(imageNamed: "personLily")
        self.texture!.filteringMode = .nearest

        self.zPosition = 500
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
