import SpriteKit

class TerrainInfoManager {
    static let shared = TerrainInfoManager()

    private var terrainMap = [TerrainType: TerrainInfo]()

    private init() {
        GameData.getTerrainInfos().forEach({terrainMap[$0.type] = $0})
    }

    func getTerrainInfo(terrainType: TerrainType) -> TerrainInfo? {
        if let info = terrainMap[terrainType] {
            return info
        }

        print ("[TerrainInfoManager] [Desc=Info not found] [terrainType=\(terrainType)]")
        return nil
    }
}
