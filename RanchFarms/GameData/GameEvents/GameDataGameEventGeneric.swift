extension GameData {

    static func getGameEventGeneric() -> [GameEvent] {
        var data = [GameEvent]()

        data.append(GameEvent(gameEventId: .Sleep_FarmBed, priority: 100,
                              trigger: Trigger(buildingId: .SingleBed, actionType: .Interact),
                              requirements: [Requirement](),
                              bedBuildingId: .SingleBed))

        return data
    }
}
