import SpriteKit

class ItemInfoManager {
    static let shared = ItemInfoManager()

    private var itemInfoMap = [ItemId: ItemInfo]()

    private init() {
        loadData()
    }

    private func loadData() {
        let cmdDataItemInfo = CmdDataItemInfo()
        cmdDataItemInfo.execute()

        if cmdDataItemInfo.result != .Success {
            print ("[ItemInfoManager] [Error=ItemInfo.csv could not be loaded] [Result=\(cmdDataItemInfo.result)]")
        }

        cmdDataItemInfo.itemInfos.forEach({itemInfoMap[$0.id] = $0})
    }

    func getItemInfo(itemId: ItemId) -> ItemInfo? {
        if let itemInfo = itemInfoMap[itemId] {
            return itemInfo
        }

        print ("[ItemInfoManager] [Desc=ItemInfo not found] [itemId=\(itemId)]")
        return nil
    }
}
