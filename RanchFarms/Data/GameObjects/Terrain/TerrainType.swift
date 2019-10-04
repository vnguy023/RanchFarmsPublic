import SpriteKit

enum TerrainType: UInt, Codable {
    case Tilled
    case Watered

    // Craftable Floors
    case Wood = 100
    case StonePath
}
