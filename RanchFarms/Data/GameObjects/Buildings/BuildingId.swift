enum BuildingId: UInt, Codable {
    case Unknown = 0

    case PlayerHouseSign
    case VendingMachine

    case Door = 100
    case FarmDeliveryBox

    case SingleBed = 110

    case Chair = 500
    case Table
    case TV

    case Rock = 1000

    case Garlic = 2000
    case Turnip
}
