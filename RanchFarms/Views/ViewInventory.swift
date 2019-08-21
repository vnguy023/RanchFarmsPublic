import SpriteKit

class ViewInventory: SKSpriteNode {
    private var MAX_ITEM_SIZE = CGFloat(10)

    private var selectedItemPos = 0

    private var itemButtons = [ViewItemButton]()
    private var inventory: Inventory

    init(inventory: Inventory) {
        self.inventory = inventory

        let inventorySize = CGSize(width: Config.itemImageSize.width * MAX_ITEM_SIZE, height: Config.itemImageSize.height)
        super.init(texture: nil, color: .red, size: inventorySize)

        for index in 0 ..< Int(MAX_ITEM_SIZE) {
            let itemButton = ViewItemButton(item: inventory.items[index])
            itemButton.zPosition = 100
            itemButton.position.x = inventorySize.width / -2 + (CGFloat(index) * Config.itemImageSize.width) + Config.itemImageSize.width/2
            self.addChild(itemButton)
        }
    }

    func getSelectedItem() -> Item? {
        return inventory.items[selectedItemPos]
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
