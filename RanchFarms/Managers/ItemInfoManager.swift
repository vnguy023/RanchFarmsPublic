import SpriteKit

class ItemInfoManager {
    static let shared = ItemInfoManager()

    private var itemIdToItemInfoMap = [ItemId: ItemInfo]()

    private init() {
        loadItemInfo()
    }

    func getItemInfo(itemId: ItemId) -> ItemInfo? {
        if let itemInfo = itemIdToItemInfoMap[itemId] {
            return itemInfo
        }

        print ("[ItemInfoManager] [Desc=ItemId] [itemId=\(itemId)]")
        return nil
    }

    private func loadItemInfo() {
        itemIdToItemInfoMap[.Axe] = ItemInfo(itemId: .Axe, itemType: .Axe, name: "Axe")
        itemIdToItemInfoMap[.FishingPole] = ItemInfo(itemId: .FishingPole, itemType: .FishingPole, name: "FishingPole")
        itemIdToItemInfoMap[.Hammer] = ItemInfo(itemId: .Hammer, itemType: .Axe, name: "Hammer")
        itemIdToItemInfoMap[.Hoe] = ItemInfo(itemId: .Hoe, itemType: .Axe, name: "Hoe")
        itemIdToItemInfoMap[.PickAxe] = ItemInfo(itemId: .PickAxe, itemType: .Axe, name: "PickAxe")
        itemIdToItemInfoMap[.Sickle] = ItemInfo(itemId: .Sickle, itemType: .Axe, name: "Sickle")
        itemIdToItemInfoMap[.WaterCan] = ItemInfo(itemId: .WaterCan, itemType: .Axe, name: "WaterCan")
    }
}
