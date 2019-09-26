import SpriteKit

class GameEventManager {
    static let shared = GameEventManager()

    private var gameEventMap = [GameEventId: GameEvent]()

    private init() {
        loadDialog()
        loadStores()
        loadTeleports()
    }

    func getGameEvent(gameEventId: GameEventId) -> GameEvent? {
        if let gameEvent = gameEventMap[gameEventId] {
            return gameEvent
        }

        print ("[GameEventManager] [Desc=GameEvent not found] [GameEventId=\(gameEventId)]")
        return nil
    }

    // TODO: need to verify this
    func getGameEventsTriggered(personId: PersonId, actionType: ActionType) -> [GameEvent] {
        var result = [GameEvent]()
        for gameEvent in gameEventMap.filter({$0.value.trigger.type == .PersonId}) {
            if gameEvent.value.trigger.actionType == actionType && personId == gameEvent.value.trigger.personId {
                result.append(gameEvent.value)
            }
        }
        return result.sorted(by: {return $0.priority < $1.priority})
    }

    func getGameEventsTriggered(buildingId: BuildingId, actionType: ActionType) -> [GameEvent] {
        var result = [GameEvent]()
        for gameEvent in gameEventMap.filter({$0.value.trigger.type == .BuildingId}) {
            if gameEvent.value.trigger.actionType == actionType && buildingId == gameEvent.value.trigger.buildingId {
                result.append(gameEvent.value)
            }
        }
        return result.sorted(by: {return $0.priority < $1.priority})
    }

    // TODO: still need to verify this
    func getGameEventsTriggered(boundary: CGRect, location: Location) -> [GameEvent] {
        var result = [GameEvent]()
        for gameEvent in gameEventMap.filter({$0.value.trigger.type == .Presence}) {
            if gameEvent.value.trigger.botLeftMapPoint.location == location {
                let triggerBoundary = CGRect(x: CGFloat(gameEvent.value.trigger.botLeftMapPoint.x) * Config.tileSize.width,
                                             y: CGFloat(gameEvent.value.trigger.botLeftMapPoint.x) * Config.tileSize.height,
                                             width: CGFloat(gameEvent.value.trigger.topRightMapPoint.x - gameEvent.value.trigger.topRightMapPoint.x) * Config.tileSize.height,
                                             height: CGFloat(gameEvent.value.trigger.topRightMapPoint.y - gameEvent.value.trigger.topRightMapPoint.y) * Config.tileSize.height)
                if boundary.intersects(triggerBoundary) {
                    result.append(gameEvent.value)
                }
            }
        }
        return result.sorted(by: {return $0.priority < $1.priority})
    }

    private func loadDialog() {
        gameEventMap[.Dialog_Sign] = GameEvent(gameEventId: .Dialog_Sign, priority: 100,
                                               trigger: Trigger(buildingId: .PlayerHouseSign, actionType: .Interact),
                                               dialogId: 0)
    }

    private func loadStores() {
        gameEventMap[.Store_VendingMachine] = GameEvent(gameEventId: .Store_VendingMachine, priority: 100,
                                                        trigger: Trigger(buildingId: .VendingMachine, actionType: .Interact),
                                                        storeFrontId: .VendingMachine,
                                                        storeCatalogId: .VendingMachine)
    }

    private func loadTeleports() {
        // House
        gameEventMap[.Teleport_House_Farm] = GameEvent(gameEventId: .Teleport_House_Farm, priority: 100,
                                                       trigger: Trigger(buildingId: .HouseToFarmDoor, actionType: .Interact),
                                                       teleportId: .House_Farm)

        // Farm
        gameEventMap[.Teleport_Farm_House] = GameEvent(gameEventId: .Teleport_Farm_House, priority: 100,
                                                       trigger: Trigger(buildingId: .FarmToHouseDoor, actionType: .Interact),
                                                       teleportId: .Farm_House)
        gameEventMap[.Teleport_Farm_Town] = GameEvent(gameEventId: .Teleport_Farm_Town, priority: 100,
                                                      trigger: Trigger(buildingId: .FarmToTownDoor, actionType: .Interact),
                                                      teleportId: .Farm_Town)

        // GeneralStore
        gameEventMap[.Teleport_GeneralStore_Town] = GameEvent(gameEventId: .Teleport_GeneralStore_Town, priority: 100,
                                                              trigger: Trigger(buildingId: .GeneralStoreToTownDoor, actionType: .Interact),
                                                              teleportId: .GeneralStore_Town)

        // SouthBeach
        gameEventMap[.Teleport_SouthBeach_Town] = GameEvent(gameEventId: .Teleport_SouthBeach_Town, priority: 100,
                                                            trigger: Trigger(buildingId: .SouthBeachToTownDoor, actionType: .Interact),
                                                            teleportId: .SouthBeach_Town)

        // Town
        gameEventMap[.Teleport_Town_Farm] = GameEvent(gameEventId: .Teleport_Town_Farm, priority: 100,
                                                      trigger: Trigger(buildingId: .TownToFarmDoor, actionType: .Interact),
                                                      teleportId: .Town_Farm)
        gameEventMap[.Teleport_Town_GeneralStore] = GameEvent(gameEventId: .Teleport_Town_GeneralStore, priority: 100,
                                                              trigger: Trigger(buildingId: .TownToGeneralStoreDoor, actionType: .Interact),
                                                              teleportId: .Town_GeneralStore)
        gameEventMap[.Teleport_Town_SouthBeach] = GameEvent(gameEventId: .Teleport_Town_SouthBeach, priority: 100,
                                                            trigger: Trigger(buildingId: .TownToSouthBeachDoor, actionType: .Interact),
                                                            teleportId: .Town_SouthBeach)
    }
}
