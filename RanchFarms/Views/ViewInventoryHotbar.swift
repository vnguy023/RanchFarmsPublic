import SpriteKit

class ViewInventoryHotbar: SKSpriteNode {
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
        itemButtons.forEach({$0.removeFromParent()})
        itemButtons.removeAll()

        for index in 0 ..< Int(Config.viewInventoryColumns) {
            let itemButton = ViewItemButton(item: inventory.items[index])
            itemButton.zPosition = 100
            itemButton.position.x = self.size.width / -2 + (CGFloat(index) * Config.itemImageSize.width) + Config.itemImageSize.width/2
            self.addChild(itemButton)

            if index == hudInterfaceData.highlightedItemInventoryHotbarIndex {
                itemButton.state = .Highlight
            }

            itemButtons.append(itemButton)
        }
    }

    func getSelectedItem() -> Item? {
        return inventory.items[hudInterfaceData.highlightedItemInventoryHotbarIndex]
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
