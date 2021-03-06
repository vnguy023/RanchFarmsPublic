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
    var spriteIndex: SpriteIndex? = nil
    var hasSpriteIndices = false
    var boundaryAnchorPoint = CGPoint(x: 0.5, y: 0.5)
    var boundarySize = Config.tileSize
    let boundaryTrim = CGFloat(2) // this is to account for imperfect movement
    var isBlocking = false

    var zOffset: CGFloat { return 0 }

    // Animations/SFX
    var stateDurationElapsed = Int(0) // GameTicks since we stateChanged

    private var mSfxApplied: SFXId? = nil
    var sfxApplied: SFXId? {
        get {return mSfxApplied}
        set {
            mSfxApplied = newValue
            sfxDurationElapsed = 0
            if newValue == nil {
                resetSFX()
            }
        }
    }
    var sfxDurationElapsed = Int(0) // GameTicks since we applied sfxDuration

    init (player: PlayerIndex, mapPoint: MapPoint) {
        self.player = player
        mMapPoint = MapPoint(x: 0, y: 0, location: Location(gameAreaId: .House))
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
        applyTexture(frame.texture)
        self.sprite.size = CGSize(width: frame.imageSize.width * Config.tileSize.width,
                                  height: frame.imageSize.height * Config.tileSize.height)
        self.sprite.anchorPoint = frame.anchorPoint
    }

    func applySFXFrame(_ frame: SFXFrame) {
        self.sprite.position = CGPoint(x: frame.translation.x * Config.tileSize.width,
                                       y: frame.translation.y * Config.tileSize.height)
        self.sprite.zRotation = frame.rotation
    }

    func resetSFX() {
        self.sprite.position = CGPoint()
        self.sprite.zRotation = 0
    }

    func applyTexture(_ texture: SKTexture?) {
        if texture != nil {
            if hasSpriteIndices && spriteIndex != nil {
                self.sprite.texture = SKTexture(rect: spriteIndex!.getRect(),
                                                in: texture!)
                return
            }
            self.sprite.texture = texture!
        } else {
            // Not sure why we would ever need this
            self.sprite.texture = nil
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
