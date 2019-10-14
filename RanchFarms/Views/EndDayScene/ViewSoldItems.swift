import SpriteKit

class ViewSoldItems: SKNode {
    private let world: World
    private let hudInterfaceData: HudInterfaceDataEndDay

    let startPos = CGPoint(x: Config.screenSize.width / -4, y: Config.screenSize.height / 4)

    var itemSprites = [ViewItemButton]()

    init(world: World, hudInterfaceData: HudInterfaceDataEndDay) {
        self.world = world
        self.hudInterfaceData = hudInterfaceData

        super.init()

        update()
    }

    func update() {
        itemSprites.forEach({$0.removeFromParent()})
        itemSprites.removeAll()

        for index in 0..<world.farmDeliveryBox.count {
            let itemSprite = ViewItemButton(item: world.farmDeliveryBox.getItems()[index])
            itemSprite.position = startPos
            itemSprite.position.y -= (itemSprite.size.height + 16)*CGFloat(index)

            self.addChild(itemSprite)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
