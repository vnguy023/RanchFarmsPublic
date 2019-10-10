enum GameEventId: UInt, Codable {
    case Unknown = 0

    case Dialog_Sign

    case Sleep_FarmBed

    // Store
    case Store_VendingMachine

    // Teleports
    case Teleport_House_Farm = 1000
    case Teleport_Farm_House
    case Teleport_Farm_Town
    case Dialog_GeneralStoreClosed
    case Teleport_GeneralStore_Town
    case Teleport_JamesHouse_Town
    case Teleport_SouthBeach_Town
    case Teleport_SouthBeach_DungeonEntrance
    case Teleport_Town_Farm
    case Teleport_Town_GeneralStore
    case Teleport_Town_JamesHouse
    case Teleport_Town_SouthBeach
    case Teleport_DungeonEntrance_SouthBeach

    // Lily
    case Lily_Greeting = 10000
    case Lily_Talk

    // James
    case James_Greeting = 11000
    case James_Talk
}
