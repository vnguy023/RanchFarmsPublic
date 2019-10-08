extension GameData {
    static func getGameEventJames() -> [GameEvent] {
        let personId = PersonId.James

        var data = [GameEvent]()

        var requirements = [Requirement]()


        requirements.removeAll()
        requirements.append(Requirement(gameEventId: .James_Greeting, seen: false))
        data.append(GameEvent(gameEventId: .James_Greeting, priority: 1000,
        trigger: Trigger(personId: personId, actionType: .Interact),
        requirements: requirements,
        dialogId: .James_Greeting))

        requirements.removeAll()
        data.append(GameEvent(gameEventId: .James_Talk, priority: 100,
                              trigger: Trigger(personId: personId, actionType: .Interact),
                              requirements: requirements,
                              dialogId: .James_Talk))

        return data
    }
}
