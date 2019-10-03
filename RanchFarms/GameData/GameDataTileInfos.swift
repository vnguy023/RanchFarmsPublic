import SpriteKit

extension GameData {

    static func getTileInfos() -> [TileInfo] {
        var data = [TileInfo]()

        data.append(TileInfo(tileId: .Dirt,
                             tileType: .Dirt,
                             hasSpriteIndices: false,
                             isBlocking: false,
                             name: "Dirt"))
        data.append(TileInfo(tileId: .Grass,
                             tileType: .Grass,
                             hasSpriteIndices: false,
                             isBlocking: false,
                             name: "Grass"))
        data.append(TileInfo(tileId: .Sand,
                             tileType: .Sand,
                             hasSpriteIndices: false,
                             isBlocking: false,
                             name: "Sand"))
        data.append(TileInfo(tileId: .StonePath,
                             tileType: .Grass,
                             hasSpriteIndices: false,
                             isBlocking: false,
                             name: "StonePath"))
        data.append(TileInfo(tileId: .Water,
                             tileType: .Water,
                             hasSpriteIndices: false,
                             isBlocking: true,
                             name: "Water"))

        return data
    }
}

