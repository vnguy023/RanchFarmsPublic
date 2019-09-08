import SpriteKit

class GameObject: SKNode {
    override var position: CGPoint {
        get { return super.position }
        set { super.position = newValue
            mMapPoint.x = Int(super.position.x) / Int(Config.tileSize.width)
            mMapPoint.y = Int(super.position.y) / Int(Config.tileSize.height)
            if super.position.x < 0 { mMapPoint.x -= 1 }
            if super.position.y < 0 { mMapPoint.y -= 1 }
        }
    }

    var location: Location {
        get {return mMapPoint.location }
        set {mMapPoint.location = newValue}
    }

    private var mMapPoint: MapPoint
    var mapPoint: MapPoint {
        get {return mMapPoint}
        set {
            mMapPoint = newValue
            super.position = CGPoint(x: CGFloat(mMapPoint.x) * Config.tileSize.width,
                                     y: CGFloat(mMapPoint.y) * Config.tileSize.height)
        }
    }

    var faceDirection = CGVector.SOUTH

    var moveSpeed = Config.tileSize.width * 4 / 60

    var inventory = Inventory()
    var money = Int(1050)

    let sprite = SKSpriteNode(color: .red, size: Config.tileSize)

    init (mapPoint: MapPoint) {
        mMapPoint = MapPoint(x: 0, y: 0, location: .House)
        super.init()
        self.mapPoint = mapPoint

        self.addChild(sprite)
    }

    func getPositionInFront() -> CGPoint {
        return self.position + faceDirection.scale(Config.tileSize.width)
    }

    func applyTexture(_ texture: SKTexture?) {
        if texture != nil {
            self.sprite.texture = texture!
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
