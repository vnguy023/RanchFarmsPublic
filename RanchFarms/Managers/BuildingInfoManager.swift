import SpriteKit

class BuildingInfoManager {
    static let shared = BuildingInfoManager()

    private var buildingIdToBuildingInfo = [BuildingId: BuildingInfo]()

    private init() {
        loadBuildingInfo()
    }

    func getBuildingInfo(buildingId: BuildingId) -> BuildingInfo? {
        if let buildingInfo = buildingIdToBuildingInfo[buildingId] {
            return buildingInfo
        }

        print ("[BuildingInfoManager] [Desc=BuildingId] [BuildingId=\(buildingId)]")
        return nil
    }

    private func loadBuildingInfo() {
        buildingIdToBuildingInfo[.Door] = BuildingInfo(buildingId: .Door, buildingType: .Teleport, name: "Door")
        buildingIdToBuildingInfo[.FarmDeliveryBox] = BuildingInfo(buildingId: .FarmDeliveryBox, buildingType: .DeliveryBox, name: "Farm Sell Box")
        buildingIdToBuildingInfo[.Rock] = BuildingInfo(buildingId: .Rock, buildingType: .Unknown, name: "Rock")
        buildingIdToBuildingInfo[.SingleBed] = BuildingInfo(buildingId: .SingleBed, buildingType: .Bed, name: "Single Bed")

        buildingIdToBuildingInfo[.Chair] = BuildingInfo(buildingId: .Chair, buildingType: .Unknown, name: "Chair")
        buildingIdToBuildingInfo[.Table] = BuildingInfo(buildingId: .Table, buildingType: .Unknown, name: "Table")
        buildingIdToBuildingInfo[.TV] = BuildingInfo(buildingId: .TV, buildingType: .Unknown, name: "TV")

        // Crops
        var garlicTextureMap = [Int: String]()
        garlicTextureMap[0] = "garlic1"
        garlicTextureMap[1] = "garlic2"
        garlicTextureMap[2] = "garlic3"
        garlicTextureMap[4] = "garlic4"
        garlicTextureMap[6] = "garlic5"
        garlicTextureMap[8] = "garlic6"
        buildingIdToBuildingInfo[.Garlic] = BuildingInfo(buildingId: .Garlic, buildingType: .Crop, name: "Garlic", growthTextureMap: garlicTextureMap)

        var turnipTextureMap = [Int: String]()
        turnipTextureMap[0] = "turnip1"
        turnipTextureMap[1] = "turnip2"
        turnipTextureMap[2] = "turnip3"
        turnipTextureMap[4] = "turnip4"
        turnipTextureMap[5] = "turnip5"
        buildingIdToBuildingInfo[.Turnip] = BuildingInfo(buildingId: .Turnip, buildingType: .Crop, name: "Turnip", growthTextureMap: turnipTextureMap)

        // Temporary stuff that we should replace
        buildingIdToBuildingInfo[.PlayerHouseSign] = BuildingInfo(buildingId: .PlayerHouseSign, buildingType: .Sign, name: "Player House Sign")
        buildingIdToBuildingInfo[.VendingMachine] = BuildingInfo(buildingId: .VendingMachine, buildingType: .VendingMachine, name: "Vending Machine")
    }
}
