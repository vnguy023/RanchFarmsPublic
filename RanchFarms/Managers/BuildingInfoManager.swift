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

        print ("[BuildingInfoManager] [Desc=BuildingId] [BuildingId=\(buildingId)]")
        return nil
    }

    private func loadBuildingInfo() {
        buildingIdToBuildingInfo[.FarmDeliveryBox] = BuildingInfo(buildingId: .FarmDeliveryBox,
                                                                  buildingType: .DeliveryBox,
                                                                  objSize: CGSize(width: Config.tileSize.width * 2,
                                                                                  height: Config.tileSize.height * 1),
                                                                  name: "Farm Sell Box")
        buildingIdToBuildingInfo[.Rock] = BuildingInfo(buildingId: .Rock,
                                                       buildingType: .Unknown,
                                                       objSize: CGSize(width: Config.tileSize.width * 1,
                                                                       height: Config.tileSize.height * 1),
                                                       name: "Rock")
        buildingIdToBuildingInfo[.SingleBed] = BuildingInfo(buildingId: .SingleBed,
                                                            buildingType: .Bed,
                                                            objSize: CGSize(width: Config.tileSize.width * 2,
                                                                            height: Config.tileSize.height * 2),
                                                            name: "Single Bed")

        buildingIdToBuildingInfo[.Chair] = BuildingInfo(buildingId: .Chair,
                                                        buildingType: .Unknown,
                                                        objSize: CGSize(width: Config.tileSize.width * 1,
                                                                        height: Config.tileSize.height * 1),
                                                        name: "Chair")
        buildingIdToBuildingInfo[.Table] = BuildingInfo(buildingId: .Table,
                                                        buildingType: .Unknown,
                                                        objSize: CGSize(width: Config.tileSize.width * 2,
                                                                        height: Config.tileSize.height * 2),
                                                        name: "Table")
        buildingIdToBuildingInfo[.TV] = BuildingInfo(buildingId: .TV,
                                                     buildingType: .Unknown,
                                                     objSize: CGSize(width: Config.tileSize.width * 2,
                                                                     height: Config.tileSize.height * 2),
                                                     name: "TV")

        // Crops
        buildingIdToBuildingInfo[.Garlic] = BuildingInfo(buildingId: .Garlic,
                                                         buildingType: .Crop,
                                                         objSize: CGSize(width: Config.tileSize.width * 1,
                                                                         height: Config.tileSize.height * 1),
                                                         name: "Garlic",
                                                         harvestDate: 8,
                                                         harvestItemId: .Garlic,
                                                         teleport: nil)

        buildingIdToBuildingInfo[.Turnip] = BuildingInfo(buildingId: .Turnip,
                                                         buildingType: .Crop,
                                                         objSize: CGSize(width: Config.tileSize.width * 1,
                                                                         height: Config.tileSize.height * 1),
                                                         name: "Turnip",
                                                         harvestDate: 4,
                                                         harvestItemId: .Turnip,
                                                         teleport: nil)

        // Temporary stuff that we should replace
        buildingIdToBuildingInfo[.PlayerHouseSign] = BuildingInfo(buildingId: .PlayerHouseSign,
                                                                  buildingType: .Sign,
                                                                  objSize: CGSize(width: Config.tileSize.width * 1,
                                                                                  height: Config.tileSize.height * 1),
                                                                  name: "Player House Sign")
        buildingIdToBuildingInfo[.VendingMachine] = BuildingInfo(buildingId: .VendingMachine,
                                                                 buildingType: .VendingMachine,
                                                                 objSize: CGSize(width: Config.tileSize.width * 2,
                                                                                 height: Config.tileSize.height * 1),
                                                                 name: "Vending Machine")
    }

    private func loadBuildingInfoDoors() {
        // TODO: convert teleport to have teleport manager
        buildingIdToBuildingInfo[.HouseToFarmDoor] = BuildingInfo(buildingId: .HouseToFarmDoor,
                                                                  buildingType: .Teleport,
                                                                  objSize: CGSize(width: Config.tileSize.width * 1,
                                                                                  height: Config.tileSize.height * 2),
                                                                  name: "House To Farm Door",
                                                                  harvestDate: 0,
                                                                  harvestItemId: nil,
                                                                  teleport: Teleport(mapPoint: MapPoint(x: 3, y: 5, location: .Farm),
                                                                                     directionToFace: .SOUTH))

        buildingIdToBuildingInfo[.FarmToHouseDoor] = BuildingInfo(buildingId: .FarmToHouseDoor,
                                                                  buildingType: .Teleport,
                                                                  objSize: CGSize(width: Config.tileSize.width * 1,
                                                                                  height: Config.tileSize.height * 2),
                                                                  name: "Farm To House Door",
                                                                  harvestDate: 0,
                                                                  harvestItemId: nil,
                                                                  teleport: Teleport(mapPoint: MapPoint(x: 1, y: 0, location: .House),
                                                                                     directionToFace: .NORTH))

        buildingIdToBuildingInfo[.FarmToTownDoor] = BuildingInfo(buildingId: .FarmToTownDoor,
                                                                  buildingType: .Teleport,
                                                                  objSize: CGSize(width: Config.tileSize.width * 1,
                                                                                  height: Config.tileSize.height * 2),
                                                                  name: "Farm To Town Door",
                                                                  harvestDate: 0,
                                                                  harvestItemId: nil,
                                                                  teleport: Teleport(mapPoint: MapPoint(x: 0, y: 0, location: .Town),
                                                                                     directionToFace: .EAST))

        buildingIdToBuildingInfo[.TownToFarmDoor] = BuildingInfo(buildingId: .TownToFarmDoor,
                                                                 buildingType: .Teleport,
                                                                 objSize: CGSize(width: Config.tileSize.width * 1,
                                                                                 height: Config.tileSize.height * 2),
                                                                 name: "Town To Farm Door",
                                                                 harvestDate: 0,
                                                                 harvestItemId: nil,
                                                                 teleport: Teleport(mapPoint: MapPoint(x: 5, y: 3, location: .Farm),
                                                                                    directionToFace: .WEST))
    }
}
