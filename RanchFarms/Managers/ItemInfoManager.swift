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
        itemIdToItemInfoMap[.Axe] =             ItemInfo(itemId: .Axe,
                                                         itemType: .Axe,
                                                         name: "Axe",
                                                         canSell: false,
                                                         sellPrice: 0,
                                                         purchasePrice: 0)
        itemIdToItemInfoMap[.FishingPole] =     ItemInfo(itemId: .FishingPole,
                                                         itemType: .FishingPole,
                                                         name: "Fishing Pole",
                                                         canSell: false,
                                                         sellPrice: 0,
                                                         purchasePrice: 0)
        itemIdToItemInfoMap[.Hammer] =          ItemInfo(itemId: .Hammer,
                                                         itemType: .Hammer,
                                                         name: "Hammer",
                                                         canSell: false,
                                                         sellPrice: 0,
                                                         purchasePrice: 0)
        itemIdToItemInfoMap[.Hoe] =             ItemInfo(itemId: .Hoe,
                                                         itemType: .Hoe,
                                                         name: "Hoe",
                                                         canSell: false,
                                                         sellPrice: 0,
                                                         purchasePrice: 0)
        itemIdToItemInfoMap[.PickAxe] =         ItemInfo(itemId: .PickAxe,
                                                         itemType: .PickAxe,
                                                         name: "PickAxe",
                                                         canSell: false,
                                                         sellPrice: 0,
                                                         purchasePrice: 0)
        itemIdToItemInfoMap[.Sickle] =          ItemInfo(itemId: .Sickle,
                                                         itemType: .Sickle,
                                                         name: "Sickle",
                                                         canSell: false,
                                                         sellPrice: 0,
                                                         purchasePrice: 0)
        itemIdToItemInfoMap[.WaterCan] =        ItemInfo(itemId: .WaterCan,
                                                         itemType: .WaterCan,
                                                         name: "Water Can",
                                                         canSell: false,
                                                         sellPrice: 0,
                                                         purchasePrice: 0)

        // Crops
        itemIdToItemInfoMap[.GarlicSeed] =      ItemInfo(itemId: .GarlicSeed,
                                                         itemType: .Seed,
                                                         name: "Garlic Seed",
                                                         canSell: true,
                                                         sellPrice: 20,
                                                         purchasePrice: 40)
        itemIdToItemInfoMap[.Garlic] =          ItemInfo(itemId: .Garlic,
                                                         itemType: .Crop,
                                                         name: "Garlic",
                                                         canSell: true,
                                                         sellPrice: 60,
                                                         purchasePrice: 120)
    }
}
