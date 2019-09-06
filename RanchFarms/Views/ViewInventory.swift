import SpriteKit

class ViewInventory: SKSpriteNode {
    let world: World
    let hudInterfaceData: HudInterfaceData

    private var itemButtons = [ViewItemButton]()

    private var inventory: Inventory {
        get {return world.player.inventory}
    }

    init(world: World, hudInterfaceData: HudInterfaceData) {
        self.hudInterfaceData = hudInterfaceData
        self.world = world

        let inventorySize = CGSize(width: Config.itemImageSize.width * Config.viewInventoryColumns,
                                   height: Config.itemImageSize.height)
        super.init(texture: nil, color: .red, size: inventorySize)

        update()
    }

    func update() {
        itemButtons.forEach({$0.removeFromParent()})
        itemButtons.removeAll()

        var index = 0

        for y in 0 ..< Int(Config.viewInventoryRows) {
            for x in 0 ..< Int(Config.viewInventoryColumns) {
                let itemButton = ViewItemButton(item: inventory.items[index])
                itemButton.zPosition = 100
                itemButton.position.x = self.size.width / -2 + (CGFloat(x) * Config.itemImageSize.width) + Config.itemImageSize.width/2
                itemButton.position.y = self.size.height / 2 - (CGFloat(y) * Config.itemImageSize.height) - Config.itemImageSize.height/2
                self.addChild(itemButton)

                if index == hudInterfaceData.selectedItemInventoryIndex {
                    itemButton.state = .Select
                }

                if index == hudInterfaceData.highlightedItemInventoryIndex {
                    itemButton.state = .Highlight
                }

                index += 1

                itemButtons.append(itemButton)
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
