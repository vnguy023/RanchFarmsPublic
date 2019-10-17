import SpriteKit

class TileInfoManager {
    static let shared = TileInfoManager()

    private var tileMap = [TileId: TileInfo]()
    var tileInfos: [TileInfo]{ get {tileMap.map({return $0.value})} }

    private init() {
        loadData()
    }

    private func loadData() {
        let cmdDataTileInfo = CmdDataTileInfo()
        cmdDataTileInfo.execute()

        if cmdDataTileInfo.result != .Success {
            print ("[TileInfoManager] [Error=TileInfo.csv could not be loaded] [Result=\(cmdDataTileInfo.result)]")
        }

        cmdDataTileInfo.tileInfos.forEach({tileMap[$0.id] = $0})
    }

    func getTileInfo(tileId: TileId) -> TileInfo? {
        if let info = tileMap[tileId] {
            return info
        }

        print ("[TileInfoManager] [Desc=Info not found] [TileId=\(tileId)]")
        return nil
    }
}
