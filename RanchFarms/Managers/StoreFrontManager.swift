import SpriteKit

class StoreFrontManager {
    static let shared = StoreFrontManager()

    private var storeFrontMap = [StoreFrontId: StoreFront]()

    private init() {
        loadStoreFronts()
    }

    func getStoreFront(storeFrontId: StoreFrontId) -> StoreFront? {
        if let storeFront = storeFrontMap[storeFrontId] {
            return storeFront
        }

        print ("[StoreFrontManager] [Desc=Unable to find StoreFront] [storeFrontId=\(storeFrontId)]")
        return nil
    }

    private func loadStoreFronts() {
        storeFrontMap[.VendingMachine] = StoreFront(storeFrontId: .VendingMachine, portraitId: .VendingMachine, slogan: "Vending Machine")
    }
}
