import SpriteKit

class BuildingInfoManager {
    static let shared = BuildingInfoManager()

    private var buildingInfoMap = [BuildingId: BuildingInfo]()

    private init() {
        GameData.getBuildingInfos().forEach({buildingInfoMap[$0.id] = $0})
    }

    func getBuildingInfo(buildingId: BuildingId) -> BuildingInfo? {
        if let buildingInfo = buildingInfoMap[buildingId] {
            return buildingInfo
        }

        print ("[BuildingInfoManager] [Desc=Info not found] [BuildingId=\(buildingId)]")
        return nil
    }
}
