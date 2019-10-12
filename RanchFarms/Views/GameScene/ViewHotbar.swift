import SpriteKit

class ViewHotbar: SKSpriteNode {
    let world: World

    var hudInterfaceData: HudInterfaceDataGame {
        get {return world.hudInterfaceData}
    }

    private var itemButtons = [ViewItemButton]()
    private var inventory: Inventory {
        get {return world.player.inventory}
    }

    init(world: World) {
        self.world = world

        let inventorySize = CGSize(width: Config.itemImageSize.width * Config.viewInventoryColumns,
                                   height: Config.itemImageSize.height)
        super.init(texture: nil, color: .red, size: inventorySize)

        update()
    }

    func update() {
        itemButtons.forEach({$0.removeFromParent()})
        itemButtons.removeAll()

        for index in 0 ..< Int(Config.viewInventoryColumns) {
            let itemButton = ViewItemButton(item: inventory.items[index])
            itemButton.zPosition = 100
            itemButton.position.x = self.size.width / -2 + (CGFloat(index) * Config.itemImageSize.width) + Config.itemImageSize.width/2
            self.addChild(itemButton)

            if let hotbarItemIndex = hudInterfaceData.getHotBarItemIndex(), index == hotbarItemIndex {
                itemButton.state = .Highlight
            }

            itemButtons.append(itemButton)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
