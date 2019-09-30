class Requirement {
    let type: RequirementType

    let startTime: GameTick!
    let endTime: GameTick!
    let dayId: DayId!
    let personId: PersonId!

    private init(requirementType: RequirementType,
                 startTime: GameTick?, endTime: GameTick?,
                 dayId: DayId?,
                 personId: PersonId?) {
        self.type = requirementType

        self.startTime = startTime
        self.endTime = endTime
        self.dayId = dayId
        self.personId = personId
    }

    convenience init(startTime: GameTick, endTime: GameTick) {
        self.init(requirementType: .Time,
                  startTime: startTime, endTime: endTime,
                  dayId: nil,
                  personId: nil)
    }

    convenience init(dayId: DayId) {
        self.init(requirementType: .Day,
                  startTime: nil, endTime: nil,
                  dayId: dayId,
                  personId: nil)
    }

    convenience init(personId: PersonId) {
        self.init(requirementType: .NPC,
                  startTime: nil, endTime: nil,
                  dayId: nil,
                  personId: personId)
    }
}

