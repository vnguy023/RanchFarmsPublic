import SpriteKit

enum TerrainType: UInt, Codable {
    case Tilled
    case Watered
    case TilledWatered

    // Craftable Floors
    case Wood = 100
}
