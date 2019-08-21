import SpriteKit

class ViewItemButton: SKSpriteNode {

    private var backgroundSprite = SKSpriteNode(imageNamed: "hudItemBorder")
    private var itemSprite: SKSpriteNode!
    private var quantityLabel: SKLabelNode!

    private var mHighlight = false
    var highlight: Bool {
        get { return mHighlight}
        set {
            mHighlight = newValue
            if mHighlight {
                backgroundSprite.texture = SKTexture(imageNamed: "hudItemBorderHighlight")
            } else {
                backgroundSprite.texture = SKTexture(imageNamed: "hudItemBorder")
            }
        }
    }

    init(item: Item?) {
        super.init(texture: nil, color: .red, size: Config.itemImageSize)
        backgroundSprite.size = Config.itemImageSize
        self.addChild(backgroundSprite)

        highlight = false

        if item != nil {
            itemSprite = SKSpriteNode(texture: nil, color: .red, size: Config.itemImageSize)
            itemSprite.zPosition = 100
            itemSprite.texture = TextureManager.shared.getTexture(itemType: item!.itemType)
            self.addChild(itemSprite)

            if item!.quantity > 1 {
                quantityLabel = SKLabelNode(fontNamed: "Chalkduster")
                quantityLabel.zPosition = 150
                quantityLabel.position = CGPoint(x: self.size.width/2, y: (self.size.height / -2))
                quantityLabel.horizontalAlignmentMode = .right
                quantityLabel.verticalAlignmentMode = .bottom
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
