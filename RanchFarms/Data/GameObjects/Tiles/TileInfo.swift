import SpriteKit

class TileInfo {
    let id: TileId

    let tileType: TileType
    let isBlocking: Bool
    let name: String

    init(tileId: TileId, tileType: TileType, isBlocking: Bool, name: String) {
        self.id = tileId
        self.tileType = tileType
        self.isBlocking = isBlocking
        self.name = name
    }
}
