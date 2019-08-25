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
        itemIdToItemInfoMap[.Axe]           = ItemInfo(itemId: .Axe,            itemType: .Axe,             name: "Axe")
        itemIdToItemInfoMap[.FishingPole]   = ItemInfo(itemId: .FishingPole,    itemType: .FishingPole,     name: "Fishing Pole")
        itemIdToItemInfoMap[.Hammer]        = ItemInfo(itemId: .Hammer,         itemType: .Hammer,          name: "Hammer")
        itemIdToItemInfoMap[.Hoe]           = ItemInfo(itemId: .Hoe,            itemType: .Hoe,             name: "Hoe")
        itemIdToItemInfoMap[.PickAxe]       = ItemInfo(itemId: .PickAxe,        itemType: .PickAxe,         name: "PickAxe")
        itemIdToItemInfoMap[.Sickle]        = ItemInfo(itemId: .Sickle,         itemType: .Sickle,          name: "Sickle")
        itemIdToItemInfoMap[.WaterCan]      = ItemInfo(itemId: .WaterCan,       itemType: .WaterCan,        name: "Water Can")

        // Crops
        itemIdToItemInfoMap[.GarlicSeed]    = ItemInfo(itemId: .GarlicSeed,     itemType: .Seed,            name: "Garlic Seed")
        itemIdToItemInfoMap[.Garlic]        = ItemInfo(itemId: .Garlic,         itemType: .Unknown,         name: "Garlic")
    }
}
