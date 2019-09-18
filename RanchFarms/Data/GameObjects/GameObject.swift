import SpriteKit

class GameObject: SKNode {
    var player: PlayerIndex

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
    var boundaryAnchorPoint = CGPoint(x: 0.5, y: 0.5)
    var boundarySize = Config.tileSize
    let boundaryTrim = CGFloat(2) // this is to account for imperfect movement

    var zOffset: CGFloat { return 0 }

    init (player: PlayerIndex, mapPoint: MapPoint) {
        self.player = player
        mMapPoint = MapPoint(x: 0, y: 0, location: .House)
        super.init()
        self.mapPoint = mapPoint

        self.addChild(sprite)
    }

    func boundaryContains(point: CGPoint) -> Bool {
        let bottomLeftPoint = CGPoint(x: self.position.x - boundarySize.width * boundaryAnchorPoint.x,
                                      y: self.position.y - boundarySize.height * boundaryAnchorPoint.y)
        let topRightPoint = CGPoint(x: bottomLeftPoint.x + boundarySize.width,
                                    y: bottomLeftPoint.y + boundarySize.height)

        if bottomLeftPoint.x + boundaryTrim <= point.x && point.x <= topRightPoint.x - boundaryTrim
            && bottomLeftPoint.y + boundaryTrim <= point.y && point.y <= topRightPoint.y - boundaryTrim {
            return true
        }

        return false
    }

    func getBoundary(newPosition: CGPoint) -> CGRect {
        return CGRect(x: newPosition.x - boundarySize.width * boundaryAnchorPoint.x,
                      y: newPosition.y - boundarySize.height * boundaryAnchorPoint.y,
                      width: boundarySize.width,
                      height: boundarySize.height)
    }

    func getBoundary() -> CGRect {
        return getBoundary(newPosition: position)
    }

    func getPositionInFront() -> CGPoint {
        return self.position + faceDirection.scale(Config.tileSize.width)
    }

    func applyAnimationFrame(_ frame: AnimationFrame) {
        self.sprite.texture = frame.texture
        self.sprite.size = frame.imageSize
        self.sprite.anchorPoint = frame.anchorPoint
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
