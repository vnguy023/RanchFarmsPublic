class Store {
    let storeFrontId: StoreFrontId
    let storeCatalogId: StoreCatalogId

    let storeFront: StoreFront
    private let storeCatalog: StoreCatalog

    var items = [Item?]()
    private var capacity = Config.viewStoreItemColumns * Config.viewStoreItemRows

    init(storeFrontId: StoreFrontId, storeCatalogId: StoreCatalogId) {
        self.storeFrontId = storeFrontId
        self.storeCatalogId = storeCatalogId

        // TODO: Fill this out properly
        storeFront = StoreFront(storeFrontId: storeFrontId, portraitId: .VendingMachine, slogan: "Welcome2")
        storeCatalog = StoreCatalog(storeCatalogId: storeCatalogId)

        while items.count < Int(capacity) {
            items.append(nil)
        }
    }
}
