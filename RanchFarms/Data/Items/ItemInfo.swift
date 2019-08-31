class ItemInfo {
    let id: ItemId

    let itemType: ItemType
    let name: String
    let maxStack: Int

    init(itemId: ItemId, itemType: ItemType, name: String) {
        self.id = itemId
        self.itemType = itemType
        self.name = name
        self.maxStack = 999
    }
}
