extension GameData {

    static func getGameEventTeleports() -> [GameEvent] {
        var data = [GameEvent]()

        var requirements = [Requirement]()

        // House
        data.append(GameEvent(gameEventId: .Teleport_House_Farm, priority: 100,
                              trigger: Trigger(start: MapPoint(x: 1, y: -2, location: .House),
                                               end: MapPoint(x: 1, y: -2, location: .House)),
                              requirements: [Requirement](),
                              teleportId: .House_Farm))

        // Farm
        data.append(GameEvent(gameEventId: .Teleport_Farm_House, priority: 100,
                              trigger: Trigger(buildingId: .FarmToHouseDoor, actionType: .Interact),
                              requirements: [Requirement](),
                              teleportId: .Farm_House))
        data.append(GameEvent(gameEventId: .Teleport_Farm_Town, priority: 100,
                              trigger: Trigger(buildingId: .FarmToTownDoor, actionType: .Interact),
                              requirements: [Requirement](),
                              teleportId: .Farm_Town))

        // GeneralStore
        data.append(GameEvent(gameEventId: .Teleport_GeneralStore_Town, priority: 100,
                              trigger: Trigger(start: MapPoint(x: 1, y: -2, location: .GeneralStore),
                                               end: MapPoint(x: 1, y: -2, location: .GeneralStore)),
                              requirements: [Requirement](),
                              teleportId: .GeneralStore_Town))

        // SouthBeach
        data.append(GameEvent(gameEventId: .Teleport_SouthBeach_Town, priority: 100,
                              trigger: Trigger(start: MapPoint(x: 4, y: 2, location: .SouthBeach),
                                               end: MapPoint(x: 4, y: 2, location: .SouthBeach)),
                              requirements: [Requirement](),
                              teleportId: .SouthBeach_Town))

        // Town
        data.append(GameEvent(gameEventId: .Teleport_Town_Farm, priority: 100,
                              trigger: Trigger(buildingId: .TownToFarmDoor, actionType: .Interact),
                              requirements: [Requirement](),
                              teleportId: .Town_Farm))

        data.append(GameEvent(gameEventId: .Dialog_GeneralStoreClosed, priority: 0,
                              trigger: Trigger(buildingId: .TownToGeneralStoreDoor, actionType: .Interact),
                              requirements: [Requirement](),
                              dialogId: 0))
        requirements.removeAll()
        requirements.append(Requirement(startTime: Config.GameTicksPerGameHour * 8, endTime: Config.GameTicksPerGameHour * 16))
        data.append(GameEvent(gameEventId: .Teleport_Town_GeneralStore, priority: 100,
                              trigger: Trigger(buildingId: .TownToGeneralStoreDoor, actionType: .Interact),
                              requirements: requirements,
                              teleportId: .Town_GeneralStore))

        data.append(GameEvent(gameEventId: .Teleport_Town_SouthBeach, priority: 100,
                              trigger: Trigger(start: MapPoint(x: 4, y: -7, location: .Town),
                                               end: MapPoint(x: 4, y: -7, location: .Town)),
                              requirements: [Requirement](),
                              teleportId: .Town_SouthBeach))
        return data
    }
}
