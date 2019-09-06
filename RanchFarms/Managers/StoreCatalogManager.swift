import SpriteKit

class StoreCatalogManager {
    static let shared = StoreCatalogManager()

    private var storeCatalogMap = [StoreCatalogId: StoreCatalog]()

    private init() {
        loadStoreCatalogs()
    }

    func getStoreCatalog(storeCatalogId: StoreCatalogId) -> StoreCatalog? {
        if let storeCatalog = storeCatalogMap[storeCatalogId] {
            return storeCatalog
        }

        print ("[StoreCatalogManager] [Desc=Unable to find StoreCatalog] [storeCatalogId=\(storeCatalogId)]")
        return nil
    }

    private func loadStoreCatalogs() {
        var items = [Item]()

        items = [Item]()
        items.append(Item(itemId: .GarlicSeed, quantity: 1))
        storeCatalogMap[.VendingMachine] = StoreCatalog(storeCatalogId: .VendingMachine, items: items)
    }
}
