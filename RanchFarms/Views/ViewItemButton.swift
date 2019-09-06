import SpriteKit

class ViewItemButton: SKSpriteNode {
    private var itemSprite: SKSpriteNode!
    private var shadowSprite: SKSpriteNode!
    private var quantityLabel: SKLabelNode!

    enum State {
        case None
        case Select
        case Highlight
    }

    private var mState = State.None
    var state: State {
        get { return mState}
        set {
            mState = newValue
            switch mState {
            case .Highlight:
                self.texture = TextureManager.shared.getTexture(hudImageName: "hudItemBorderHighlight")
            case .Select:
                self.texture = TextureManager.shared.getTexture(hudImageName: "hudItemBorderSelect")
            default:
                self.texture = TextureManager.shared.getTexture(hudImageName: "hudItemBorder")
            }
        }
    }

    init(item: Item?) {
        super.init(texture: nil, color: .red, size: Config.itemImageSize)

        state = .None

        setItem(item: item)
    }

    func setItem(item: Item?) {
        if itemSprite != nil {
            itemSprite.removeFromParent()
            itemSprite = nil
        }
        if shadowSprite != nil {
            shadowSprite.removeFromParent()
            shadowSprite = nil
        }
        if quantityLabel != nil {
            quantityLabel.removeFromParent()
            quantityLabel = nil
        }

        if item != nil {
            itemSprite = SKSpriteNode(texture: nil, color: .red, size: Config.itemImageSize)
            itemSprite.zPosition = 100
            itemSprite.texture = TextureManager.shared.getTexture(itemId: item!.itemId)
            self.addChild(itemSprite)

            shadowSprite = SKSpriteNode(texture: nil, color: .red, size: Config.itemImageSize)
            shadowSprite.zPosition = 50
            shadowSprite.texture = TextureManager.shared.getTexture(hudImageName: "hudItemBorderShadow")
            self.addChild(shadowSprite)

            if item!.quantity > 1 {
                quantityLabel = SKLabelNode(fontNamed: "Chalkduster")
                quantityLabel.zPosition = 150
                quantityLabel.position = CGPoint(x: self.size.width/2 - 4, y: (self.size.height / 2) - 4)
                quantityLabel.horizontalAlignmentMode = .right
                quantityLabel.verticalAlignmentMode = .top
                quantityLabel.fontSize = 24
                quantityLabel.fontColor = .purple
                quantityLabel.text = "\(item!.quantity)"
                self.addChild(quantityLabel)
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
