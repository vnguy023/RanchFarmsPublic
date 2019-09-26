extension GameData {

    static func getGameEventTeleports() -> [GameEvent] {
        var data = [GameEvent]()

        // House
        data.append(GameEvent(gameEventId: .Teleport_House_Farm, priority: 100,
                              trigger: Trigger(buildingId: .HouseToFarmDoor, actionType: .Interact),
                              teleportId: .House_Farm))

        // Farm
        data.append(GameEvent(gameEventId: .Teleport_Farm_House, priority: 100,
                              trigger: Trigger(buildingId: .FarmToHouseDoor, actionType: .Interact),
                              teleportId: .Farm_House))
        data.append(GameEvent(gameEventId: .Teleport_Farm_Town, priority: 100,
                              trigger: Trigger(buildingId: .FarmToTownDoor, actionType: .Interact),
                              teleportId: .Farm_Town))

        // GeneralStore
        data.append(GameEvent(gameEventId: .Teleport_GeneralStore_Town, priority: 100,
                              trigger: Trigger(buildingId: .GeneralStoreToTownDoor, actionType: .Interact),
                              teleportId: .GeneralStore_Town))

        // SouthBeach
        data.append(GameEvent(gameEventId: .Teleport_SouthBeach_Town, priority: 100,
                              trigger: Trigger(buildingId: .SouthBeachToTownDoor, actionType: .Interact),
                              teleportId: .SouthBeach_Town))

        // Town
        data.append(GameEvent(gameEventId: .Teleport_Town_Farm, priority: 100,
                              trigger: Trigger(buildingId: .TownToFarmDoor, actionType: .Interact),
                              teleportId: .Town_Farm))

        data.append(GameEvent(gameEventId: .Dialog_GeneralStoreClosed, priority: 0,
                              trigger: Trigger(buildingId: .TownToGeneralStoreDoor, actionType: .Interact),
                              dialogId: 0))
        data.append(GameEvent(gameEventId: .Teleport_Town_GeneralStore, priority: 100,
                              trigger: Trigger(buildingId: .TownToGeneralStoreDoor, actionType: .Interact),
                              teleportId: .Town_GeneralStore))

        data.append(GameEvent(gameEventId: .Teleport_Town_SouthBeach, priority: 100,
                              trigger: Trigger(buildingId: .TownToSouthBeachDoor, actionType: .Interact),
                              teleportId: .Town_SouthBeach))
        return data
    }
}
