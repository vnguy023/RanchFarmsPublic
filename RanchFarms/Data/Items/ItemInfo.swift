class ItemInfo {
    let id: ItemId

    let itemType: ItemType
    let name: String
    let maxStack: Int

    let canSell: Bool
    let sellPrice: Int
    let purchasePrice: Int

    let buildingId: BuildingId?

    // default
    init(itemId: ItemId, itemType: ItemType, name: String, canSell: Bool, sellPrice: Int, purchasePrice: Int, buildingId: BuildingId?) {
        self.id = itemId
        self.itemType = itemType
        self.name = name
        self.maxStack = 999
        self.canSell = canSell
        self.sellPrice = sellPrice
        self.purchasePrice = purchasePrice

        self.buildingId = buildingId
    }

    // standardItem
    convenience init(itemId: ItemId, itemType: ItemType, name: String, canSell: Bool, sellPrice: Int, purchasePrice: Int) {
        self.init(itemId: itemId,
                  itemType: itemType,
                  name: name,
                  canSell: canSell,
                  sellPrice: sellPrice,
                  purchasePrice: purchasePrice,
                  buildingId: nil)
    }

    // Crops -- same as default
    /*
    convenience init(itemId: ItemId, itemType: ItemType, name: String, canSell: Bool, sellPrice: Int, purchasePrice: Int, buildingId: BuildingId) {
        self.init(itemId: itemId,
                    itemType: itemType,
                    name: name,
                    canSell: canSell,
                    sellPrice: sellPrice,
                    purchasePrice: purchasePrice,
                    buildingId: buildingId)
    }
     */
}
