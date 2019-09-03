class ItemInfo {
    let id: ItemId

    let itemType: ItemType
    let name: String
    let maxStack: Int

    let canSell: Bool
    let sellPrice: Int
    let purchasePrice: Int

    init(itemId: ItemId, itemType: ItemType, name: String, canSell: Bool, sellPrice: Int, purchasePrice: Int) {
        self.id = itemId
        self.itemType = itemType
        self.name = name
        self.maxStack = 999
        self.canSell = canSell
        self.sellPrice = sellPrice
        self.purchasePrice = purchasePrice
    }
}
