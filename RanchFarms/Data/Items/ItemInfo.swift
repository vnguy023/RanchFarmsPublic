class ItemInfo {
    let id: ItemId

    let itemType: ItemType
    let name: String
    let maxStack: Int

    let canSell: Bool
    let sellPrice: Int
    let purchasePrice: Int

    let buildingId: BuildingId?

    init(itemId: ItemId, itemType: ItemType, name: String, maxStack: Int, canSell: Bool, sellPrice: Int, purchasePrice: Int, buildingId: BuildingId?) {
        self.id = itemId
        self.itemType = itemType
        self.name = name
        self.maxStack = 999
        self.canSell = canSell
        self.sellPrice = sellPrice
        self.purchasePrice = purchasePrice

        self.buildingId = buildingId
    }
}
