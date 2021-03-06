extension GameData {

    static func getGameEventDialogs() -> [GameEvent] {
        var data = [GameEvent]()

        data.append(GameEvent(gameEventId: .Dialog_Sign, priority: 100,
                              trigger: Trigger(buildingId: .PlayerHouseSign, actionType: .Interact),
                              requirements: [Requirement](),
                              dialogId: .Dummy))

        return data
    }
}
