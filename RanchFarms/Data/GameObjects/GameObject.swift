import SpriteKit

class GameObject: SKSpriteNode {
    override var position: CGPoint {
        get { return super.position }
        set { super.position = newValue }
    }
    var location = Location.Farm

    var faceDirection = CGVector.SOUTH

    var moveSpeed = Config.tileSize.width * 4 / 60

    var inventory = Inventory()
    var money = Int(1050)

    init() {
        super.init(texture: nil, color: .red, size: CGSize(width: 32, height: 32))
    }
    init (position: CGPoint, location: Location) {
        super.init(texture: nil, color: .red, size: CGSize(width: 32, height: 32))
    
        self.position = position
        self.location = location
    }

    func getPositionInFront() -> CGPoint {
        return self.position + faceDirection.scale(Config.tileSize.width)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
