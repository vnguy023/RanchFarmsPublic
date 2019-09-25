import SpriteKit

class BuildingInfoManager {
    static let shared = BuildingInfoManager()

    private var buildingIdToBuildingInfo = [BuildingId: BuildingInfo]()

    private init() {
        loadBuildingInfo()
        loadBuildingInfoDoors()
    }

    func getBuildingInfo(buildingId: BuildingId) -> BuildingInfo? {
        if let buildingInfo = buildingIdToBuildingInfo[buildingId] {
            return buildingInfo
        }

        print ("[BuildingInfoManager] [Desc=Info not found] [BuildingId=\(buildingId)]")
        return nil
    }

    private func loadBuildingInfo() {
        buildingIdToBuildingInfo[.FarmDeliveryBox] = BuildingInfo(buildingId: .FarmDeliveryBox,
                                                                  buildingType: .DeliveryBox,
                                                                  objSize: CGSize(width: 2, height: 1),
                                                                  isBlocking: true,
                                                                  name: "Farm Sell Box")
        buildingIdToBuildingInfo[.Rock] = BuildingInfo(buildingId: .Rock,
                                                       buildingType: .Unknown,
                                                       objSize: CGSize(width: 1, height: 1),
                                                       isBlocking: true,
                                                       name: "Rock")
        buildingIdToBuildingInfo[.SingleBed] = BuildingInfo(buildingId: .SingleBed,
                                                            buildingType: .Bed,
                                                            objSize: CGSize(width: 2, height: 2),
                                                            isBlocking: true,
                                                            name: "Single Bed")

        buildingIdToBuildingInfo[.Chair] = BuildingInfo(buildingId: .Chair,
                                                        buildingType: .Unknown,
                                                        objSize: CGSize(width: 1, height: 1),
                                                        isBlocking: true,
                                                        name: "Chair")
        buildingIdToBuildingInfo[.Table] = BuildingInfo(buildingId: .Table,
                                                        buildingType: .Unknown,
                                                        objSize: CGSize(width: 2, height: 2),
                                                        isBlocking: true,
                                                        name: "Table")
        buildingIdToBuildingInfo[.TV] = BuildingInfo(buildingId: .TV,
                                                     buildingType: .Unknown,
                                                     objSize: CGSize(width: 2, height: 2),
                                                     isBlocking: true,
                                                     name: "TV")
        buildingIdToBuildingInfo[.FarmHouse] = BuildingInfo(buildingId: .FarmHouse,
                                                            buildingType: .Unknown,
                                                            objSize: CGSize(width: 5, height: 5),
                                                            isBlocking: true,
                                                            name: "Farm House")
        buildingIdToBuildingInfo[.Wall] = BuildingInfo(buildingId: .Wall,
                                                        buildingType: .Unknown,
                                                        objSize: CGSize(width: 1, height: 1),
                                                        isBlocking: true,
                                                        name: "Wall")


        // Crops
        buildingIdToBuildingInfo[.Garlic] = BuildingInfo(buildingId: .Garlic,
                                                         buildingType: .Crop,
                                                         objSize: CGSize(width: 1, height: 1),
                                                         isBlocking: false,
                                                         name: "Garlic",
                                                         harvestDate: 8,
                                                         harvestItemId: .Garlic)

        buildingIdToBuildingInfo[.Turnip] = BuildingInfo(buildingId: .Turnip,
                                                         buildingType: .Crop,
                                                         objSize: CGSize(width: 1, height: 1),
                                                         isBlocking: false,
                                                         name: "Turnip",
                                                         harvestDate: 4,
                                                         harvestItemId: .Turnip)

        // Temporary stuff that we should replace
        buildingIdToBuildingInfo[.PlayerHouseSign] = BuildingInfo(buildingId: .PlayerHouseSign,
                                                                  buildingType: .Unknown,
                                                                  objSize: CGSize(width: 1, height: 1),
                                                                  isBlocking: true,
                                                                  name: "Player House Sign",
                                                                  gameEventId: .Dialog_Sign)
        buildingIdToBuildingInfo[.VendingMachine] = BuildingInfo(buildingId: .VendingMachine,
                                                                 buildingType: .Unknown,
                                                                 objSize: CGSize(width: 2, height: 1),
                                                                 isBlocking: true,
                                                                 name: "Vending Machine",
                                                                 gameEventId: .Store_VendingMachine)
    }

    private func loadBuildingInfoDoors() {
        // TODO: convert teleport to have teleport manager
        buildingIdToBuildingInfo[.HouseToFarmDoor] = BuildingInfo(buildingId: .HouseToFarmDoor,
                                                                  buildingType: .Unknown,
                                                                  objSize: CGSize(width: 1, height: 2),
                                                                  isBlocking: true,
                                                                  name: "House To Farm Door",
                                                                  gameEventId: .Teleport_House_Farm)

        buildingIdToBuildingInfo[.FarmToHouseDoor] = BuildingInfo(buildingId: .FarmToHouseDoor,
                                                                  buildingType: .Unknown,
                                                                  objSize: CGSize(width: 1, height: 2),
                                                                  isBlocking: true,
                                                                  name: "Farm To House Door",
                                                                  gameEventId: .Teleport_Farm_House)

        buildingIdToBuildingInfo[.FarmToTownDoor] = BuildingInfo(buildingId: .FarmToTownDoor,
                                                                  buildingType: .Unknown,
                                                                  objSize: CGSize(width: 1, height: 2),
                                                                  isBlocking: true,
                                                                  name: "Farm To Town Door",
                                                                  gameEventId: .Teleport_Farm_Town)

        buildingIdToBuildingInfo[.GeneralStoreToTownDoor] = BuildingInfo(buildingId: .GeneralStoreToTownDoor,
                                                                         buildingType: .Unknown,
                                                                         objSize: CGSize(width: 1, height: 2),
                                                                         isBlocking: true,
                                                                         name: "GeneralStore to Town",
                                                                         gameEventId: .Teleport_GeneralStore_Town)

        buildingIdToBuildingInfo[.SouthBeachToTownDoor] = BuildingInfo(buildingId: .SouthBeachToTownDoor,
                                                                       buildingType: .Unknown,
                                                                       objSize: CGSize(width: 1, height: 2),
                                                                       isBlocking: true,
                                                                       name: "SouthBeach to Town",
                                                                       gameEventId: .Teleport_SouthBeach_Town)

        buildingIdToBuildingInfo[.TownToFarmDoor] = BuildingInfo(buildingId: .TownToFarmDoor,
                                                                 buildingType: .Unknown,
                                                                 objSize: CGSize(width: 1, height: 2),
                                                                 isBlocking: true,
                                                                 name: "Town To Farm Door",
                                                                 gameEventId: .Teleport_Town_Farm)

        buildingIdToBuildingInfo[.TownToGeneralStoreDoor] = BuildingInfo(buildingId: .TownToGeneralStoreDoor,
                                                                         buildingType: .Unknown,
                                                                         objSize: CGSize(width: 1, height: 2),
                                                                         isBlocking: true,
                                                                         name: "Town to GeneralStore",
                                                                         gameEventId: .Teleport_Town_GeneralStore)

        buildingIdToBuildingInfo[.TownToSouthBeachDoor] = BuildingInfo(buildingId: .TownToSouthBeachDoor,
                                                                       buildingType: .Unknown,
                                                                       objSize: CGSize(width: 1, height: 2),
                                                                       isBlocking: true,
                                                                       name: "Town to SouthBeach",
                                                                       gameEventId: .Teleport_Town_SouthBeach)
    }
}
