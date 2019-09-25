enum TeleportId: UInt, Codable {
    case Unknown = 0
    
    case House_Farm
    case House_Bed

    case Farm_House
    case Farm_Town

    case GeneralStore_Town

    case SouthBeach_Town

    case Town_Farm
    case Town_GeneralStore
    case Town_SouthBeach
}
