extension GameData {

    static func getGameEventStores() -> [GameEvent] {
        var gameEvents = [GameEvent]()

        gameEvents.append(GameEvent(gameEventId: .Store_VendingMachine, priority: 100,
                                    trigger: Trigger(buildingId: .VendingMachine, actionType: .Interact),
                                    storeFrontId: .VendingMachine,
                                    storeCatalogId: .VendingMachine))

        return gameEvents
    }
}
