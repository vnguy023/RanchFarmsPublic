import SpriteKit

class Item {
    let itemId: ItemId
    var type: ItemType {
        get {return itemInfo.itemType}
    }

    var quantity: Int

    let itemInfo: ItemInfo!

    init(itemId: ItemId, quantity: Int) {
        self.itemId = itemId
        itemInfo = ItemInfoManager.shared.getItemInfo(itemId: itemId)

        self.quantity = quantity
    }

    func clone() -> Item {
        return Item(itemId: itemId, quantity: quantity)
    }
}
