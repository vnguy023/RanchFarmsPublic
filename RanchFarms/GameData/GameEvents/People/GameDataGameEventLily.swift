extension GameData {

    static func getGameEventLily() -> [GameEvent] {
        let personId = PersonId.Lily

        var data = [GameEvent]()

        var requirements = [Requirement]()

        requirements.removeAll()
        requirements.append(Requirement(gameEventId: .Lily_Greeting, seen: false))
        data.append(GameEvent(gameEventId: .Lily_Greeting, priority: 1000,
        trigger: Trigger(personId: personId, actionType: .Interact),
        requirements: requirements,
        dialogId: .Lily_Greeting))

        requirements.removeAll()
        data.append(GameEvent(gameEventId: .Lily_Talk, priority: 100,
                              trigger: Trigger(personId: personId, actionType: .Interact),
                              requirements: requirements,
                              dialogId: .Lily_Talk))

        return data
    }
}
