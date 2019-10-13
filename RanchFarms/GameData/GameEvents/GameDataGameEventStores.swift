extension GameData {

    static func getGameEventStores() -> [GameEvent] {
        var data = [GameEvent]()

        data.append(GameEvent(gameEventId: .Store_VendingMachine, priority: 100,
                              trigger: Trigger(buildingId: .Cashier, actionType: .Interact),
                              requirements: [Requirement](),
                              storeFrontId: .Cashier,
                              storeCatalogId: .Cashier))

        return data
    }
}
