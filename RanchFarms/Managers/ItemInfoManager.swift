import SpriteKit

class ItemInfoManager {
    static let shared = ItemInfoManager()

    private var itemInfoMap = [ItemId: ItemInfo]()

    private init() {
        GameData.getItemInfos().forEach({itemInfoMap[$0.id] = $0})
    }

    func getItemInfo(itemId: ItemId) -> ItemInfo? {
        if let itemInfo = itemInfoMap[itemId] {
            return itemInfo
        }

        print ("[ItemInfoManager] [Desc=ItemInfo not found] [itemId=\(itemId)]")
        return nil
    }
}
