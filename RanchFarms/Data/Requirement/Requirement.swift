class Requirement {
    let type: RequirementType

    let startTime: GameTick!
    let endTime: GameTick!
    let dayId: DayId!
    let personId: PersonId!
    let dialogId: DialogId!
    let gameEventId: GameEventId!

    private init(requirementType: RequirementType,
                 startTime: GameTick?, endTime: GameTick?,
                 dayId: DayId?,
                 personId: PersonId?,
                 dialogId: DialogId?,
                 gameEventId: GameEventId?) {
        self.type = requirementType

        self.startTime = startTime
        self.endTime = endTime
        self.dayId = dayId
        self.personId = personId
        self.dialogId = dialogId
        self.gameEventId = gameEventId
    }

    convenience init(startTime: GameTick, endTime: GameTick) {
        self.init(requirementType: .Time,
                  startTime: startTime, endTime: endTime,
                  dayId: nil,
                  personId: nil,
                  dialogId: nil,
                  gameEventId: nil)
    }

    convenience init(dayId: DayId) {
        self.init(requirementType: .Day,
                  startTime: nil, endTime: nil,
                  dayId: dayId,
                  personId: nil,
                  dialogId: nil,
                  gameEventId: nil)
    }

    convenience init(personId: PersonId) {
        self.init(requirementType: .NPC,
                  startTime: nil, endTime: nil,
                  dayId: nil,
                  personId: personId,
                  dialogId: nil,
                  gameEventId: nil)
    }

    convenience init(dialogId: DialogId, seen: Bool) {
        var requirementType = RequirementType.HasSeenDialogId
        if !seen {
            requirementType = RequirementType.HasNotSeenDialogId
        }

        self.init(requirementType: requirementType,
                  startTime: nil, endTime: nil,
                  dayId: nil,
                  personId: nil,
                  dialogId: dialogId,
                  gameEventId: nil)
    }

    convenience init(gameEventId: GameEventId, seen: Bool) {
        var requirementType = RequirementType.HasSeenGameEventId
        if !seen {
            requirementType = RequirementType.HasNotSeenGameEventId
        }

        self.init(requirementType: requirementType,
                  startTime: nil, endTime: nil,
                  dayId: nil,
                  personId: nil,
                  dialogId: nil,
                  gameEventId: gameEventId)
    }
}

