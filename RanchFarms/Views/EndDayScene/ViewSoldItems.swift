import SpriteKit

class ViewSoldItems: SKNode {
    private let world: World
    private let hudInterfaceData: HudInterfaceDataEndDay

    let startPos = CGPoint(x: Config.screenSize.width / -8 * 3, y: Config.screenSize.height / 4)

    var itemSprites = [ViewItemButton]()
    var itemNames = [SKLabelNode]()
    var itemReceipts = [SKLabelNode]()

    let totalMoney = SKLabelNode(fontNamed: "ChalkDuster")

    init(world: World, hudInterfaceData: HudInterfaceDataEndDay) {
        self.world = world
        self.hudInterfaceData = hudInterfaceData

        super.init()

        totalMoney.zPosition = 100
        totalMoney.position = startPos
        totalMoney.position.x *= -1
        totalMoney.position.y = Config.screenSize.height / -8 * 3
        totalMoney.fontColor = .white
        totalMoney.fontSize = 24
        totalMoney.verticalAlignmentMode = .center
        totalMoney.horizontalAlignmentMode = .right
        self.addChild(totalMoney)

        update()
    }

    func update() {
        itemSprites.forEach({$0.removeFromParent()})
        itemSprites.removeAll()

        itemNames.forEach({$0.removeFromParent()})
        itemNames.removeAll()

        itemReceipts.forEach({$0.removeFromParent()})
        itemReceipts.removeAll()

        for index in 0..<world.farmDeliveryBox.count {
            let item = world.farmDeliveryBox.getItems()[index]

            let itemSprite = ViewItemButton(item: item)
            itemSprite.zPosition = 100
            itemSprite.position = startPos
            itemSprite.position.y -= (itemSprite.size.height + 16)*CGFloat(index)

            self.addChild(itemSprite)
            itemSprites.append(itemSprite)

            let itemName = SKLabelNode(fontNamed: "Chalkduster")
            itemName.zPosition = 100
            itemName.position = startPos
            itemName.position.x += (itemSprite.size.width + 16)
            itemName.position.y -= (itemSprite.size.height + 16)*CGFloat(index)
            itemName.fontColor = .white
            itemName.fontSize = 24
            itemName.verticalAlignmentMode = .center
            itemName.horizontalAlignmentMode = .left
            itemName.text = item.info.name + ". . ."

            self.addChild(itemName)
            itemNames.append(itemName)

            let itemReceipt = SKLabelNode(fontNamed: "Chalkduster")
            itemReceipt.zPosition = 100
            itemReceipt.position = startPos
            itemReceipt.position.x *= -1
            itemReceipt.position.y -= (itemSprite.size.height + 16)*CGFloat(index)
            itemReceipt.fontColor = .white
            itemReceipt.fontSize = 24
            itemReceipt.verticalAlignmentMode = .center
            itemReceipt.horizontalAlignmentMode = .right
            itemReceipt.text = "\(item.quantity) x (\(item.info.sellPrice) Each) = \(item.getMoneyIfSold())"

            self.addChild(itemReceipt)
            itemReceipts.append(itemReceipt)
        }

        totalMoney.text = "Total Earned Today: \(world.farmDeliveryBox.getTotalMoneyIfSold())"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
