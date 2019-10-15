import SpriteKit

extension GameData {

    static func getItemInfos() -> [ItemInfo] {
        var data = [ItemInfo]()

        data.append(ItemInfo(itemId: .Axe, itemType: .Axe,
                             name: "Axe",
                             canSell: false,
                             sellPrice: 0, purchasePrice: 0,
                             buildingId: nil))
        data.append(ItemInfo(itemId: .FishingPole, itemType: .FishingPole,
                             name: "Fishing Pole",
                             canSell: false,
                             sellPrice: 0, purchasePrice: 0,
                             buildingId: nil))
        data.append(ItemInfo(itemId: .Hammer, itemType: .Hammer,
                             name: "Hammer",
                             canSell: false,
                             sellPrice: 0, purchasePrice: 0,
                             buildingId: nil))
        data.append(ItemInfo(itemId: .Hoe, itemType: .Hoe,
                             name: "Hoe",
                             canSell: false,
                             sellPrice: 0, purchasePrice: 0,
                             buildingId: nil))
        data.append(ItemInfo(itemId: .PickAxe, itemType: .PickAxe,
                             name: "PickAxe",
                             canSell: false,
                             sellPrice: 0, purchasePrice: 0,
                             buildingId: nil))
        data.append(ItemInfo(itemId: .Sickle, itemType: .Sickle,
                             name: "Sickle",
                             canSell: false,
                             sellPrice: 0, purchasePrice: 0,
                             buildingId: nil))
        data.append(ItemInfo(itemId: .WaterCan, itemType: .WaterCan,
                             name: "Water Can",
                             canSell: false,
                             sellPrice: 0, purchasePrice: 0,
                             buildingId: nil))

        // Weapons
        data.append(ItemInfo(itemId: .Sword, itemType: .Weapon,
                             name: "Sword",
                             canSell: true,
                             sellPrice: 100, purchasePrice: 1000,
                             buildingId: nil))

        // Crops
        data.append(ItemInfo(itemId: .GarlicSeed, itemType: .Seed,
                             name: "Garlic Seed",
                             canSell: true,
                             sellPrice: 20, purchasePrice: 40,
                             buildingId: .Garlic))
        data.append(ItemInfo(itemId: .Garlic, itemType: .Crop,
                             name: "Garlic",
                             canSell: true,
                             sellPrice: 60, purchasePrice: 120,
                             buildingId: nil))
        data.append(ItemInfo(itemId: .TurnipSeed, itemType: .Seed,
                             name: "Turnip Seed",
                             canSell: true,
                             sellPrice: 5, purchasePrice: 15,
                             buildingId: .Turnip))
        data.append(ItemInfo(itemId: .Turnip, itemType: .Crop,
                             name: "Turnip",
                             canSell: true,
                             sellPrice: 40, purchasePrice: 120,
                             buildingId: nil))

        // Fish
        data.append(ItemInfo(itemId: .Crab, itemType: .Fish,
                             name: "Crab",
                             canSell: true,
                             sellPrice: 25, purchasePrice: 200,
                             buildingId: nil))

        return data
    }
}

