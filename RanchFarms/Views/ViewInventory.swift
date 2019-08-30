import SpriteKit

class ViewInventory: SKSpriteNode {
    let hudInterfaceData: HudInterfaceData

    private var itemButtons = [ViewItemButton]()
    private var inventory: Inventory

    init(inventory: Inventory, hudInterfaceData: HudInterfaceData) {
        self.hudInterfaceData = hudInterfaceData
        self.inventory = inventory

        let inventorySize = CGSize(width: Config.itemImageSize.width * Config.viewInventoryColumns,
                                   height: Config.itemImageSize.height)
        super.init(texture: nil, color: .red, size: inventorySize)

        update()
    }

    func update() {
        self.removeAllChildren()
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
            }
        }
    }

    func getSelectedItem() -> Item? {
        return inventory.items[hudInterfaceData.highlightedItemInventoryHotbarIndex]
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
