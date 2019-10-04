import SpriteKit

// Note: This class makes assumption that cornerSize will eventually be set so that it's size is greater than 2*size in both dimensions
// This sprite uses the Nine-Slice Algorithm for scaling certain parts in particular ways
// This also assumes that the texture being passed in will adhere to the custom layout for each indidivudal part

class SpriteNodeNine: SKNode {
    private var mTexture: SKTexture? = nil
    var texture: SKTexture? {
        get {return mTexture}
        set {
            if newValue == nil {
                spriteNW.texture = nil
                spriteNorth.texture = nil
                spriteNE.texture = nil

                spriteWest.texture = nil
                spriteCenter.texture = nil
                spriteEast.texture = nil

                spriteSW.texture = nil
                spriteSouth.texture = nil
                spriteSE.texture = nil
            } else {
                spriteNW.texture = SKTexture(rect: SpriteIndex.Corner_NW.getRect(), in: newValue!)
                spriteNorth.texture = SKTexture(rect: SpriteIndex.North.getRect(), in: newValue!)
                spriteNE.texture = SKTexture(rect: SpriteIndex.Corner_NE.getRect(), in: newValue!)

                spriteWest.texture = SKTexture(rect: SpriteIndex.West.getRect(), in: newValue!)
                spriteCenter.texture = SKTexture(rect: SpriteIndex.Center.getRect(), in: newValue!)
                spriteEast.texture = SKTexture(rect: SpriteIndex.East.getRect(), in: newValue!)

                spriteSW.texture = SKTexture(rect: SpriteIndex.Corner_SW.getRect(), in: newValue!)
                spriteSouth.texture = SKTexture(rect: SpriteIndex.South.getRect(), in: newValue!)
                spriteSE.texture = SKTexture(rect: SpriteIndex.Corner_SE.getRect(), in: newValue!)
            }
        }
    }

    private var mSize : CGSize
    var size : CGSize {
        get {return mSize}
        set {mSize = newValue
            fixPositions()
            fixScaling()
        }
    }

    private let spriteNW = SKSpriteNode(color: .clear, size: CGSize())
    private let spriteNorth = SKSpriteNode(color: .clear, size: CGSize())
    private let spriteNE = SKSpriteNode(color: .clear, size: CGSize())

    private let spriteWest = SKSpriteNode(color: .clear, size: CGSize())
    private let spriteCenter = SKSpriteNode(color: .clear, size: CGSize())
    private let spriteEast = SKSpriteNode(color: .clear, size: CGSize())

    private let spriteSW = SKSpriteNode(color: .clear, size: CGSize())
    private let spriteSouth = SKSpriteNode(color: .clear, size: CGSize())
    private let spriteSE = SKSpriteNode(color: .clear, size: CGSize())

    private var mCornerSize = CGSize(width: 32, height: 32)
    var cornerSize : CGSize {
        get {return mCornerSize}
        set {mCornerSize = newValue
            fixPositions()
            fixScaling()
        }
    }

    init(size: CGSize) {
        self.mSize = size
        super.init()

        self.addChild(spriteNW)
        self.addChild(spriteNorth)
        self.addChild(spriteNE)
        self.addChild(spriteWest)
        self.addChild(spriteCenter)
        self.addChild(spriteEast)
        self.addChild(spriteSW)
        self.addChild(spriteSouth)
        self.addChild(spriteSE)

        self.cornerSize = CGSize(width: 32, height: 32)
        self.size = size

        fixPositions()
        fixScaling()
    }

    private func fixScaling() {
        spriteNW.size       = cornerSize
        spriteNorth.size    = CGSize(width: size.width - cornerSize.width*2, height: cornerSize.height)
        spriteNE.size       = cornerSize

        spriteWest.size     = CGSize(width: cornerSize.width, height: size.height - cornerSize.height*2)
        spriteCenter.size   = CGSize(width: size.width - cornerSize.width*2, height: size.height - cornerSize.height*2)
        spriteEast.size     = CGSize(width: cornerSize.width, height: size.height - cornerSize.height*2)

        spriteSW.size       = cornerSize
        spriteSouth.size    = CGSize(width: size.width - cornerSize.width*2, height: cornerSize.height)
        spriteSE.size       = cornerSize
    }

    private func fixPositions() {
        spriteNW.position       = CGPoint(x: size.width / -2 + cornerSize.width/2, y: size.height / 2 - cornerSize.height/2)
        spriteNorth.position    = CGPoint(x: 0, y: size.height / 2 - cornerSize.height/2)
        spriteNE.position       = CGPoint(x: size.width / 2 - cornerSize.width/2, y: size.height / 2 - cornerSize.height/2)

        spriteWest.position     = CGPoint(x: size.width / -2 + cornerSize.width/2, y: 0)
        spriteCenter.position   = CGPoint(x: 0, y: 0)
        spriteEast.position     = CGPoint(x: size.width / 2 - cornerSize.width/2, y: 0)

        spriteSW.position       = CGPoint(x: size.width / -2 + cornerSize.width/2, y: size.height / -2 + cornerSize.height/2)
        spriteSouth.position    = CGPoint(x: 0, y: size.height / -2 + cornerSize.height/2)
        spriteSE.position       = CGPoint(x: size.width / 2 - cornerSize.width/2, y: size.height / -2 + cornerSize.height/2)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
