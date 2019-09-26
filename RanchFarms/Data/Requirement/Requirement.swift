class Requirement {
    let type: RequirementType

    let startTime: GameTick!
    let endTime: GameTick!

    private init(requirementType: RequirementType, startTime: GameTick?, endTime: GameTick?) {
        self.type = requirementType

        self.startTime = startTime
        self.endTime = endTime
    }

    convenience init(startTime: GameTick, endTime: GameTick) {
        self.init(requirementType: .Time, startTime: startTime, endTime: endTime)
    }
}

