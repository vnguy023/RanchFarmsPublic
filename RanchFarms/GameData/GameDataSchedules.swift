extension GameData {

    static func getSchedules() -> [Schedule] {
        let personId = PersonId.Lily

        var requirements = [Requirement]()
        var scheduleEvents = [ScheduleEvent]()

        var data = [Schedule]()

        requirements.removeAll()
        requirements.append(Requirement(personId: personId))

        scheduleEvents.removeAll()
        scheduleEvents.append(ScheduleEvent(startTime: GameTick(0),
                                            destination: MapPoint(x: 3, y: 3, location: .Town), teleport: true,
                                            facedirection: .SOUTH,
                                            stateAtDestination: .Idle))
        scheduleEvents.append(ScheduleEvent(startTime: GameTick(Config.GameTicksPerGameHour * 8),
                                            destination: MapPoint(x: 4, y: -3, location: .SouthBeach), teleport: false,
                                            facedirection: .SOUTH,
                                            stateAtDestination: .Idle))
        

        data.append(Schedule(scheduleId: .Lily, priority: 0, requirements: requirements, scheduleEvents: scheduleEvents))

        return data
    }
}

