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
        buildingIdToBuildingInfo[.Rock] = BuildingInfo(buildingId: .Rock, buildingType: .Unknown, name: "Rock")
        buildingIdToBuildingInfo[.SingleBed] = BuildingInfo(buildingId: .SingleBed, buildingType: .Bed, name: "SingleBed")

        // Crops
        var garlicTextureMap = [Int: String]()
        garlicTextureMap[0] = "garlic1"
        garlicTextureMap[1] = "garlic2"
        garlicTextureMap[2] = "garlic3"
        garlicTextureMap[4] = "garlic4"
        garlicTextureMap[6] = "garlic5"
        garlicTextureMap[8] = "garlic6"
        buildingIdToBuildingInfo[.Garlic] = BuildingInfo(buildingId: .Garlic, buildingType: .Crop, name: "Garlic", growthTextureMap: garlicTextureMap)
    }
}
