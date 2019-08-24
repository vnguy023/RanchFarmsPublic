class ItemInfo {
    let id: ItemId

    let itemType: ItemType
    let name: String

    init(itemId: ItemId, itemType: ItemType, name: String) {
        self.id = itemId
        self.itemType = itemType
        self.name = name
    }
}
