import SpriteKit

enum TileType: UInt, Codable {
    case Dirt = 10
    case DirtWatered
    case DirtTilled
    case DirtTilledWatered
    case Grass
    case Water

    // Craftable Floors
    case Wood = 100
}
