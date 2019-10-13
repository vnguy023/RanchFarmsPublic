class Store {
    let storeFrontId: StoreFrontId
    let storeCatalogId: StoreCatalogId

    let storeFront: StoreFront

    var items = [Item?]()
    private var capacity = Config.viewStoreItemColumns * Config.viewStoreItemRows

    init(storeFrontId: StoreFrontId, storeCatalogId: StoreCatalogId) {
        self.storeFrontId = storeFrontId
        self.storeCatalogId = storeCatalogId

        if let storeFront = StoreFrontManager.shared.getStoreFront(storeFrontId: storeFrontId) {
            self.storeFront = storeFront
        } else {
            print ("[Store] [Desc=Unable to load storeFront] [storeFrontId=\(storeFrontId)]")
            self.storeFront = StoreFront(storeFrontId: storeFrontId, portraitId: .Lily, slogan: "Welcome2")
        }

        if let storeCatalog = StoreCatalogManager.shared.getStoreCatalog(storeCatalogId: storeCatalogId) {
            for item in storeCatalog.items {
                self.items.append(item)
            }
        } else {
            print ("[Store] [Desc=Unable to load storeCatalog] [storeCatalogId=\(storeCatalogId)]")
        }

        while items.count < Int(capacity) {
            items.append(nil)
        }
    }
}
