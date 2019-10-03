import SpriteKit

extension GameData {

    static func getBuildingInfos() -> [BuildingInfo] {
        var data = [BuildingInfo]()

        data.append(BuildingInfo(buildingId: .FarmDeliveryBox,
                                 buildingType: .DeliveryBox,
                                 objSize: CGSize(width: 2, height: 1),
                                 isBlocking: true,
                                 hasSpriteIndices: false,
                                 name: "Farm Sell Box"))
        data.append(BuildingInfo(buildingId: .Rock,
                                 buildingType: .Unknown,
                                 objSize: CGSize(width: 1, height: 1),
                                 isBlocking: true,
                                 hasSpriteIndices: false,
                                 name: "Rock"))
        data.append(BuildingInfo(buildingId: .SingleBed,
                                 buildingType: .Unknown,
                                 objSize: CGSize(width: 2, height: 2),
                                 isBlocking: true,
                                 hasSpriteIndices: false,
                                 name: "Single Bed"))
        data.append(BuildingInfo(buildingId: .Chair,
                                 buildingType: .Unknown,
                                 objSize: CGSize(width: 1, height: 1),
                                 isBlocking: true,
                                 hasSpriteIndices: false,
                                 name: "Chair"))
        data.append(BuildingInfo(buildingId: .Table,
                                 buildingType: .Unknown,
                                 objSize: CGSize(width: 2, height: 2),
                                 isBlocking: true,
                                 hasSpriteIndices: false,
                                 name: "Table"))
        data.append(BuildingInfo(buildingId: .TV,
                                 buildingType: .Unknown,
                                 objSize: CGSize(width: 2, height: 2),
                                 isBlocking: true,
                                 hasSpriteIndices: false,
                                 name: "TV"))
        data.append(BuildingInfo(buildingId: .FarmHouse,
                                 buildingType: .Unknown,
                                 objSize: CGSize(width: 5, height: 5),
                                 isBlocking: true,
                                 hasSpriteIndices: false,
                                 name: "Farm House"))
        data.append(BuildingInfo(buildingId: .JamesHouse,
                                 buildingType: .Unknown,
                                 objSize: CGSize(width: 5, height: 5),
                                 isBlocking: true,
                                 hasSpriteIndices: false,
                                 name: "James House"))
        data.append(BuildingInfo(buildingId: .Wall,
                                 buildingType: .Unknown,
                                 objSize: CGSize(width: 1, height: 1),
                                 isBlocking: true,
                                 hasSpriteIndices: false,
                                 name: "Wall"))

        // Crops
        data.append(BuildingInfo(buildingId: .Garlic,
                                 buildingType: .Crop,
                                 objSize: CGSize(width: 1, height: 1),
                                 isBlocking: false,
                                 hasSpriteIndices: false,
                                 name: "Garlic",
                                 harvestDate: 8,
                                 harvestItemId: .Garlic))
        data.append(BuildingInfo(buildingId: .Turnip,
                                 buildingType: .Crop,
                                 objSize: CGSize(width: 1, height: 1),
                                 isBlocking: false,
                                 hasSpriteIndices: false,
                                 name: "Turnip",
                                 harvestDate: 4,
                                 harvestItemId: .Turnip))

        // temporary stuff
        data.append(BuildingInfo(buildingId: .PlayerHouseSign,
                                 buildingType: .Unknown,
                                 objSize: CGSize(width: 1, height: 1),
                                 isBlocking: true,
                                 hasSpriteIndices: false,
                                 name: "Player House Sign"))
        data.append(BuildingInfo(buildingId: .VendingMachine,
                                 buildingType: .Unknown,
                                 objSize: CGSize(width: 2, height: 1),
                                 isBlocking: true,
                                 hasSpriteIndices: false,
                                 name: "Vending Machine"))

        // Doors
        data.append(BuildingInfo(buildingId: .FarmToHouseDoor,
                                 buildingType: .Unknown,
                                 objSize: CGSize(width: 1, height: 2),
                                 isBlocking: true,
                                 hasSpriteIndices: false,
                                 name: "Farm To House Door"))
        data.append(BuildingInfo(buildingId: .FarmToTownDoor,
                                 buildingType: .Unknown,
                                 objSize: CGSize(width: 1, height: 2),
                                 isBlocking: true,
                                 hasSpriteIndices: false,
                                 name: "Farm To Town Door"))
        data.append(BuildingInfo(buildingId: .TownToFarmDoor,
                                 buildingType: .Unknown,
                                 objSize: CGSize(width: 1, height: 2),
                                 isBlocking: true,
                                 hasSpriteIndices: false,
                                 name: "Town To Farm Door"))
        data.append(BuildingInfo(buildingId: .TownToGeneralStoreDoor,
                                 buildingType: .Unknown,
                                 objSize: CGSize(width: 1, height: 2),
                                 isBlocking: true,
                                 hasSpriteIndices: false,
                                 name: "Town to GeneralStore"))
        data.append(BuildingInfo(buildingId: .TownToJamesHouseDoor,
                                 buildingType: .Unknown,
                                 objSize: CGSize(width: 1, height: 2),
                                 isBlocking: true,
                                 hasSpriteIndices: false,
                                 name: "Town to JamesHouse"))

        return data
    }
}

