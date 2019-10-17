import SpriteKit

class TerrainInfo {
    let type: TerrainType

    let hasSpriteIndices: Bool
    let isBlocking: Bool
    let name: String
    let textureName: String

    init(terrainType: TerrainType, hasSpriteIndices: Bool, isBlocking: Bool, name: String, textureName: String) {
        self.type = terrainType
        self.hasSpriteIndices = hasSpriteIndices
        self.isBlocking = isBlocking
        self.name = name
        self.textureName = textureName
    }
}
