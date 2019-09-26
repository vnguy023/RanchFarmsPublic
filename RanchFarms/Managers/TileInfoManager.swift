import SpriteKit

class TileInfoManager {
    static let shared = TileInfoManager()

    private var tileMap = [TileId: TileInfo]()

    private init() {
        GameData.getTileInfos().forEach({tileMap[$0.id] = $0})
    }

    func getTileInfo(tileId: TileId) -> TileInfo? {
        if let info = tileMap[tileId] {
            return info
        }

        print ("[TileInfoManager] [Desc=Info not found] [TileId=\(tileId)]")
        return nil
    }
}
