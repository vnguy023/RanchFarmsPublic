import SpriteKit

class Item {
    let id: ItemId
    var type: ItemType {
        get {return info.itemType}
    }

    var quantity: Int

    let info: ItemInfo!

    init(itemId: ItemId, quantity: Int) {
        self.id = itemId
        info = ItemInfoManager.shared.getItemInfo(itemId: itemId)

        self.quantity = quantity
    }

    convenience init(data: ItemData) {
        self.init(itemId: data.itemId, quantity: data.quantity)
    }

    func getMoneyIfSold() -> Int {
        if info.canSell {
            return info.sellPrice * quantity
        }

        return 0
    }

    func getItemData() -> ItemData {
        return ItemData(itemId: id, quantity: quantity)
    }

    func clone() -> Item {
        return Item(itemId: self.id, quantity: self.quantity)
    }
}
