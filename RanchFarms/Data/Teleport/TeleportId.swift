enum TeleportId: UInt, Codable {
    case Unknown = 0

    // Player
    case House_Bed

    // Scene Transitions
    case House_Farm

    case Farm_House
    case Farm_Town

    case GeneralStore_Town

    case JamesHouse_Town

    case SouthBeach_Town
    case SouthBeach_DungeonEntrance

    case Town_Farm
    case Town_GeneralStore
    case Town_JamesHouse
    case Town_SouthBeach

    case DungeonEntrance_SouthBeach

    // Lily Specific
    case Lily_Spawn = 1000
}
