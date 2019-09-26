extension GameData {

    static func getGameEventDialogs() -> [GameEvent] {
        var gameEvents = [GameEvent]()

        gameEvents.append(GameEvent(gameEventId: .Dialog_Sign, priority: 100,
                                    trigger: Trigger(buildingId: .PlayerHouseSign, actionType: .Interact),
                                    dialogId: 0))

        return gameEvents
    }
}
