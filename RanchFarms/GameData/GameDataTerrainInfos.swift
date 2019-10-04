import SpriteKit

extension GameData {

    static func getTerrainInfos() -> [TerrainInfo] {
        var data = [TerrainInfo]()

        data.append(TerrainInfo(terrainType: .Tilled,
                                hasSpriteIndices: false, isBlocking: false,
                                name: "Tilled"))

        data.append(TerrainInfo(terrainType: .Watered,
                                hasSpriteIndices: false, isBlocking: false,
                                name: "Watered"))

        data.append(TerrainInfo(terrainType: .Wood,
                                hasSpriteIndices: false, isBlocking: false,
                                name: "Wood"))

        data.append(TerrainInfo(terrainType: .StonePath,
                                hasSpriteIndices: true, isBlocking: false,
                                name: "StonePath"))
        return data
    }
}

