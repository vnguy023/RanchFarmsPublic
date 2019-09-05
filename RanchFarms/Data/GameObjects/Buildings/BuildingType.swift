enum BuildingType: UInt, Codable {
    case Unknown = 0

    case Sign
    case VendingMachine

    case Teleport = 100
    case DeliveryBox
    
    case Bed = 110

    case Crop = 200
}
