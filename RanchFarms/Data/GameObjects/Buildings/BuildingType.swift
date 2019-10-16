enum BuildingType: UInt, Codable {
    case Unknown = 0

    case DeliveryBox = 100

    case Crop = 200

    init?(string: String) {
        switch string{
        case "Unknown": self = .Unknown
        case "DeliveryBox": self = .DeliveryBox
        case "Crop": self = .Crop

        default:
            print ("[ItemType] [init?] [Error=Can't convert to known type] [string\(string)]")
            return nil
        }
    }
}
