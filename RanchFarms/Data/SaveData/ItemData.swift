class ItemData: Codable {
    let itemId: ItemId
    let quantity: Int

    init(itemId: ItemId, quantity: Int) {
        self.itemId = itemId
        self.quantity = quantity
    }
}
