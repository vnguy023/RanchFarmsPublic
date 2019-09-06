class StoreCatalog {
    let id: StoreCatalogId

    let items: [Item]

    init(storeCatalogId: StoreCatalogId, items: [Item]) {
        self.id = storeCatalogId
        self.items = items
    }
}
