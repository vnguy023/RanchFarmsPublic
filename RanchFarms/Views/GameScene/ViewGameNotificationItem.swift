import SpriteKit

class ViewGameNotificationItem: SKSpriteNode {
    let item: Item
    let itemSprite: ViewItemButton
    let itemName = SKLabelNode(fontNamed: "Chalkduster")

    static private let INIT_TIME_TO_DISPLAY = GameTick(Config.GameTicksPerSecond * 4)
    var timeLeftToDisplay = ViewGameNotificationItem.INIT_TIME_TO_DISPLAY

    init(item: Item) {
        self.item = item.clone()
        itemSprite = ViewItemButton(item: item.clone())

        super.init(texture: nil, color: .blue, size: Config.viewGameNotificationItemSize)

        itemSprite.position = CGPoint(x: self.size.width / -2 + itemSprite.size.width/2 + 8, y: 0)
        itemSprite.zPosition = 100
        self.addChild(itemSprite)

        itemName.horizontalAlignmentMode = .left
        itemName.verticalAlignmentMode = .center
        itemName.fontSize = 24
        itemName.fontColor = .white
        itemName.zPosition = 100
        itemName.position = CGPoint(x: itemSprite.position.x + itemSprite.size.width/2 + 8,
                                    y: 0)
        itemName.text = "\(item.info.name) x \(item.quantity)"
        self.addChild(itemName)
    }

    func update() {
        timeLeftToDisplay -= 1
        self.alpha = CGFloat(timeLeftToDisplay) / CGFloat(ViewGameNotificationItem.INIT_TIME_TO_DISPLAY) / 2 + 0.5
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
