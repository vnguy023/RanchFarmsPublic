extension GameData {
    static func getGameEventJames() -> [GameEvent] {
        let personId = PersonId.James

        var data = [GameEvent]()

        //var requirements = [Requirement]()

        data.append(GameEvent(gameEventId: .James_Talk, priority: 100,
                              trigger: Trigger(personId: personId, actionType: .Interact),
                              requirements: [Requirement](),
                              dialogId: .James_Talk))

        return data
    }
}
