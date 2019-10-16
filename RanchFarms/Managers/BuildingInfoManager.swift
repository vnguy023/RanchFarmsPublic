import SpriteKit

class BuildingInfoManager {
    static let shared = BuildingInfoManager()

    private var buildingInfoMap = [BuildingId: BuildingInfo]()
    var buildingInfos: [BuildingInfo]{ get {buildingInfoMap.map({return $0.value})} }

    private init() {
        loadData()
    }

    private func loadData() {
        let cmdDataBuildingInfo = CmdDataBuildingInfo()
        cmdDataBuildingInfo.execute()

        if cmdDataBuildingInfo.result != .Success {
            print ("[BuildingInfoManager] [Error=BuildingInfo.csv could not be loaded] [Result=\(cmdDataBuildingInfo.result)]")
        }

        cmdDataBuildingInfo.buildingInfos.forEach({buildingInfoMap[$0.id] = $0})
    }

    func getBuildingInfo(buildingId: BuildingId) -> BuildingInfo? {
        if let buildingInfo = buildingInfoMap[buildingId] {
            return buildingInfo
        }

        print ("[BuildingInfoManager] [Desc=Info not found] [BuildingId=\(buildingId)]")
        return nil
    }
}
