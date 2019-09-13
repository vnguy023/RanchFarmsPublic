import SpriteKit

class Item {
    let id: ItemId
    var type: ItemType {
        get {return itemInfo.itemType}
    }

    var quantity: Int

    let itemInfo: ItemInfo!

    init(itemId: ItemId, quantity: Int) {
        self.id = itemId
        itemInfo = ItemInfoManager.shared.getItemInfo(itemId: itemId)

        self.quantity = quantity
    }

    func getItemData() -> ItemData {
        return ItemData(itemId: id, quantity: quantity)
    }

    func clone() -> Item {
        return Item(itemId: self.id, quantity: self.quantity)
    }
}
