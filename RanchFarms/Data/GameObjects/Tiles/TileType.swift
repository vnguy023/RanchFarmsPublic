enum TileType: UInt, Codable {
    case Dirt = 10
    case Grass
    case Sand
    case Water

    init?(string: String) {
        switch string{
        case "Dirt": self = .Dirt
        case "Grass": self = .Grass
        case "Sand": self = .Sand
        case "Water": self = .Water

        default:
            print ("[TileType] [init?] [Error=Can't convert to known type] [string\(string)]")
            return nil
        }
    }
}
