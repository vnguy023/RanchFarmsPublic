import SpriteKit

class BuildingInfoManager {
    static let shared = BuildingInfoManager()

    private var buildingIdToBuildingInfo = [BuildingId: BuildingInfo]()

    private init() {
        GameData.getBuildingInfos().forEach({buildingIdToBuildingInfo[$0.id] = $0})
    }

    func getBuildingInfo(buildingId: BuildingId) -> BuildingInfo? {
        if let buildingInfo = buildingIdToBuildingInfo[buildingId] {
            return buildingInfo
        }

        print ("[BuildingInfoManager] [Desc=Info not found] [BuildingId=\(buildingId)]")
        return nil
    }
}
