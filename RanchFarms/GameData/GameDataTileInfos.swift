import SpriteKit

extension GameData {

    static func getTileInfos() -> [TileInfo] {
        var data = [TileInfo]()

        data.append(TileInfo(tileId: .Dirt,
                             tileType: .Dirt,
                             isBlocking: false,
                             name: "Dirt"))
        data.append(TileInfo(tileId: .Grass,
                             tileType: .Grass,
                             isBlocking: false,
                             name: "Grass"))
        data.append(TileInfo(tileId: .Sand,
                             tileType: .Sand,
                             isBlocking: false,
                             name: "Sand"))
        data.append(TileInfo(tileId: .StonePath,
                             tileType: .Grass,
                             isBlocking: false,
                             name: "StonePath"))
        data.append(TileInfo(tileId: .Water,
                             tileType: .Water,
                             isBlocking: true,
                             name: "Water"))

        return data
    }
}

