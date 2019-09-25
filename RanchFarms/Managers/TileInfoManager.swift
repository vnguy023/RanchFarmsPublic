import SpriteKit

class TileInfoManager {
    static let shared = TileInfoManager()

    private var tileMap = [TileId: TileInfo]()

    private init() {
        loadTileInfo()
    }

    func getTileInfo(tileId: TileId) -> TileInfo? {
        if let info = tileMap[tileId] {
            return info
        }

        print ("[TileInfoManager] [Desc=Info not found] [TileId=\(tileId)]")
        return nil
    }

    private func loadTileInfo() {
        tileMap[.Dirt] = TileInfo(tileId: .Dirt, tileType: .Dirt, isBlocking: false, name: "Dirt")
        tileMap[.Grass] = TileInfo(tileId: .Grass, tileType: .Grass, isBlocking: false, name: "Grass")
        tileMap[.Water] = TileInfo(tileId: .Water, tileType: .Water, isBlocking: true, name: "Water")
    }
}
