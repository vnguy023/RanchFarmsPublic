enum ItemType: UInt, Codable {
    case Unknown = 0

    case Seed = 50
    case Crop = 51
    case Fish = 52

    case Axe = 100
    case FishingPole
    case Hammer
    case Hoe
    case PickAxe
    case Sickle
    case WaterCan

    case Weapon = 200

    init?(string: String) {
        switch string{
        case "Unknown": self = .Unknown

        case "Seed": self = .Seed
        case "Crop": self = .Crop
        case "Fish": self = .Fish

        case "Axe": self = .Axe
        case "FishingPole": self = .FishingPole
        case "Hammer": self = .Hammer
        case "Hoe": self = .Hoe
        case "PickAxe": self = .PickAxe
        case "Sickle": self = .Sickle
        case "WaterCan": self = .WaterCan

        case "Weapon": self = .Weapon

        default:
            print ("[ItemType] [init?] [Error=Can't convert to known type] [string\(string)]")
            return nil
        }
    }
}
