import SpriteKit

class TerrainInfoManager {
    static let shared = TerrainInfoManager()

    private var terrainMap = [TerrainType: TerrainInfo]()
    var terrainInfos: [TerrainInfo]{ get {terrainMap.map({return $0.value})} }

    private init() {
        loadData()
    }

    private func loadData() {
        let cmdDataTerrainInfo = CmdDataTerrainInfo()
        cmdDataTerrainInfo.execute()

        if cmdDataTerrainInfo.result != .Success {
            print ("[TerrainInfoManager] [Error=TerrainInfo.csv could not be loaded] [Result=\(cmdDataTerrainInfo.result)]")
        }

        cmdDataTerrainInfo.terrainInfos.forEach({terrainMap[$0.type] = $0})
    }

    func getTerrainInfo(terrainType: TerrainType) -> TerrainInfo? {
        if let info = terrainMap[terrainType] {
            return info
        }

        print ("[TerrainInfoManager] [Desc=Info not found] [terrainType=\(terrainType)]")
        return nil
    }
}
