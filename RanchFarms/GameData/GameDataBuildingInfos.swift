import SpriteKit

extension GameData {

    static func getBuildingInfos() -> [BuildingInfo] {
        var data = [BuildingInfo]()

        data.append(BuildingInfo(buildingId: .FarmDeliveryBox,
                                 buildingType: .DeliveryBox,
                                 objSize: CGSize(width: 2, height: 1),
                                 isBlocking: true,
                                 name: "Farm Sell Box"))
        data.append(BuildingInfo(buildingId: .Rock,
                                 buildingType: .Unknown,
                                 objSize: CGSize(width: 1, height: 1),
                                 isBlocking: true,
                                 name: "Rock"))
        data.append(BuildingInfo(buildingId: .SingleBed,
                                 buildingType: .Bed,
                                 objSize: CGSize(width: 2, height: 2),
                                 isBlocking: true,
                                 name: "Single Bed"))
        data.append(BuildingInfo(buildingId: .Chair,
                                 buildingType: .Unknown,
                                 objSize: CGSize(width: 1, height: 1),
                                 isBlocking: true,
                                 name: "Chair"))
        data.append(BuildingInfo(buildingId: .Table,
                                 buildingType: .Unknown,
                                 objSize: CGSize(width: 2, height: 2),
                                 isBlocking: true,
                                 name: "Table"))
        data.append(BuildingInfo(buildingId: .TV,
                                 buildingType: .Unknown,
                                 objSize: CGSize(width: 2, height: 2),
                                 isBlocking: true,
                                 name: "TV"))
        data.append(BuildingInfo(buildingId: .FarmHouse,
                                 buildingType: .Unknown,
                                 objSize: CGSize(width: 5, height: 5),
                                 isBlocking: true,
                                 name: "Farm House"))
        data.append(BuildingInfo(buildingId: .Wall,
                                 buildingType: .Unknown,
                                 objSize: CGSize(width: 1, height: 1),
                                 isBlocking: true,
                                 name: "Wall"))

        // Crops
        data.append(BuildingInfo(buildingId: .Garlic,
                                 buildingType: .Crop,
                                 objSize: CGSize(width: 1, height: 1),
                                 isBlocking: false,
                                 name: "Garlic",
                                 harvestDate: 8,
                                 harvestItemId: .Garlic))
        data.append(BuildingInfo(buildingId: .Turnip,
                                 buildingType: .Crop,
                                 objSize: CGSize(width: 1, height: 1),
                                 isBlocking: false,
                                 name: "Turnip",
                                 harvestDate: 4,
                                 harvestItemId: .Turnip))

        // temporary stuff
        data.append(BuildingInfo(buildingId: .PlayerHouseSign,
                                 buildingType: .Unknown,
                                 objSize: CGSize(width: 1, height: 1),
                                 isBlocking: true,
                                 name: "Player House Sign"))
        data.append(BuildingInfo(buildingId: .VendingMachine,
                                 buildingType: .Unknown,
                                 objSize: CGSize(width: 2, height: 1),
                                 isBlocking: true,
                                 name: "Vending Machine"))

        // Doors
        data.append(BuildingInfo(buildingId: .FarmToHouseDoor,
                                 buildingType: .Unknown,
                                 objSize: CGSize(width: 1, height: 2),
                                 isBlocking: true,
                                 name: "Farm To House Door"))
        data.append(BuildingInfo(buildingId: .FarmToTownDoor,
                                 buildingType: .Unknown,
                                 objSize: CGSize(width: 1, height: 2),
                                 isBlocking: true,
                                 name: "Farm To Town Door"))
        data.append(BuildingInfo(buildingId: .TownToFarmDoor,
                                 buildingType: .Unknown,
                                 objSize: CGSize(width: 1, height: 2),
                                 isBlocking: true,
                                 name: "Town To Farm Door"))
        data.append(BuildingInfo(buildingId: .TownToGeneralStoreDoor,
                                 buildingType: .Unknown,
                                 objSize: CGSize(width: 1, height: 2),
                                 isBlocking: true,
                                 name: "Town to GeneralStore"))

        return data
    }
}

