import SpriteKit

class ViewInventory: SKSpriteNode {
    let hudInterfaceData: HudInterfaceData

    private var itemButtons = [ViewItemButton]()
    private var inventory: Inventory

    init(inventory: Inventory, hudInterfaceData: HudInterfaceData) {
        self.hudInterfaceData = hudInterfaceData
        self.inventory = inventory

        let inventorySize = CGSize(width: Config.itemImageSize.width * Config.viewInventoryWidth,
                                   height: Config.itemImageSize.height)
        super.init(texture: nil, color: .red, size: inventorySize)

        update()
    }

    func update() {
        self.removeAllChildren()
        itemButtons.removeAll()

        for index in 0 ..< Int(Config.viewInventoryWidth) {
            let itemButton = ViewItemButton(item: inventory.items[index])
            itemButton.zPosition = 100
            itemButton.position.x = self.size.width / -2 + (CGFloat(index) * Config.itemImageSize.width) + Config.itemImageSize.width/2
            self.addChild(itemButton)

            if index == hudInterfaceData.selectedItemInventoryIndex {
                itemButton.highlight = true
            }
        }
    }

    func getSelectedItem() -> Item? {
        return inventory.items[hudInterfaceData.selectedItemInventoryHotbarIndex]
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
