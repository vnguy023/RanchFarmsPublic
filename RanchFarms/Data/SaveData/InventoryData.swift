class InventoryData: Codable {
    let items: [ItemData?]

    init(items: [ItemData?]) {
        self.items = items
    }
}
