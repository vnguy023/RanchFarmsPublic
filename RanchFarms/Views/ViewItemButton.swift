import SpriteKit

class ViewItemButton: SKSpriteNode {
    private var itemSprite: SKSpriteNode!
    private var shadowSprite: SKSpriteNode!
    private var quantityLabel: SKLabelNode!

    private var mHighlight = false
    var highlight: Bool {
        get { return mHighlight}
        set {
            mHighlight = newValue
            if mHighlight {
                self.texture = TextureManager.shared.getTexture(hudImageName: "hudItemBorderHighlight")
            } else {
                self.texture = TextureManager.shared.getTexture(hudImageName: "hudItemBorder")
            }
        }
    }

    init(item: Item?) {
        super.init(texture: nil, color: .red, size: Config.itemImageSize)

        highlight = false

        if item != nil {
            itemSprite = SKSpriteNode(texture: nil, color: .red, size: Config.itemImageSize)
            itemSprite.zPosition = 100
            itemSprite.texture = TextureManager.shared.getTexture(itemType: item!.itemId)
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
