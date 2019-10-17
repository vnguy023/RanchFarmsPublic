enum TerrainType: UInt, Codable {
    case Tilled
    case Watered

    // Craftable Floors
    case Wood = 100
    case StonePath

    init?(string: String) {
        switch string{
        case "Tilled": self = .Tilled
        case "Watered": self = .Watered
        case "Wood": self = .Wood
        case "StonePath": self = .StonePath

        default:
            print ("[TerrainType] [init?] [Error=Can't convert to known type] [string\(string)]")
            return nil
        }
    }
}
