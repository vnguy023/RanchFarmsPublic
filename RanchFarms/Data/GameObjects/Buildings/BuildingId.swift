enum BuildingId: UInt, Codable {
    case Unknown = 0

    case PlayerHouseSign
    case VendingMachine
    case FarmDeliveryBox

    case FarmToHouseDoor = 10000
    case FarmToTownDoor
    case TownToFarmDoor
    case TownToGeneralStoreDoor
    case TownToJamesHouseDoor

    case SingleBed = 110

    case FarmHouse = 150
    case JamesHouse
    case Wall

    case Chair = 500
    case Table
    case TV
    case Easel

    case Rock = 1000

    case Garlic = 2000
    case Turnip
}
