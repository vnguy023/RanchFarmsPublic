import SpriteKit

class Item {
    let itemId: ItemId

    var quantity: Int

    init(itemId: ItemId, quantity: Int) {
        self.itemId = itemId

        self.quantity = quantity
    }
}
