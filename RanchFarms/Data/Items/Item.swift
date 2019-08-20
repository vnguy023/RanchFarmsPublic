import SpriteKit

class Item {
    let itemType: ItemType

    var quantity: Int

    init(itemType: ItemType, quantity: Int) {
        self.itemType = itemType

        self.quantity = quantity
    }
}
