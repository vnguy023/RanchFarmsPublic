enum GameEventId: UInt, Codable {
    case Unknown = 0

    case Dialog_Sign

    // Store
    case Store_VendingMachine

    // Teleports
    case Teleport_House_Farm = 1000
    case Teleport_Farm_House
    case Teleport_Farm_Town
    case Dialog_GeneralStoreClosed
    case Teleport_GeneralStore_Town
    case Teleport_SouthBeach_Town
    case Teleport_Town_Farm
    case Teleport_Town_GeneralStore
    case Teleport_Town_SouthBeach

    // Lily
    case Lily_Talk = 10000
}
