import SpriteKit

class TileInfo {
    let id: TileId

    let tileType: TileType
    let hasSpriteIndices: Bool
    let isBlocking: Bool
    let name: String

    init(tileId: TileId, tileType: TileType, hasSpriteIndices: Bool, isBlocking: Bool, name: String) {
        self.id = tileId
        self.tileType = tileType
        self.hasSpriteIndices = hasSpriteIndices
        self.isBlocking = isBlocking
        self.name = name
    }
}
