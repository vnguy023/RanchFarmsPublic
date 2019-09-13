class InventoryData: Codable {
    let items: [Int:ItemData]

    init(items: [Int:ItemData]) {
        self.items = items
    }
}
