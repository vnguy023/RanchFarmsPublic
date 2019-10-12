extension GameData {

    static func getGameEventEndDays() -> [GameEvent] {
        var data = [GameEvent]()

        // This is for pass out due to time
        data.append(GameEvent(gameEventId: .Sleep_Collapse_Time, priority: 1000,
                              trigger: Trigger(startTime: Config.GameTicksPerGameHour * 26),
                              requirements: [Requirement](),
                              endDayTeleport: .House_Bed))

        // Sleeping in bed
        data.append(GameEvent(gameEventId: .Sleep_FarmBed, priority: 100,
                              trigger: Trigger(buildingId: .SingleBed, actionType: .Interact),
                              requirements: [Requirement](),
                              endDayTeleport: .House_Bed))

        return data
    }
}
