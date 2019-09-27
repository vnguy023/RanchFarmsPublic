extension GameData {

    static func getGameEventLily() -> [GameEvent] {
        let personId = PersonId.Lily

        var data = [GameEvent]()

        //var requirements = [Requirement]()

        data.append(GameEvent(gameEventId: .Lily_Talk, priority: 100,
                              trigger: Trigger(personId: personId, actionType: .Interact),
                              requirements: [Requirement](),
                              dialogId: .Lily_Talk))

        return data
    }
}
