class Requirement {
    let type: RequirementType

    private init(requirementType: RequirementType, priority: Int) {
        self.type = requirementType
    }

    convenience init(priority: Int) {
        self.init(requirementType: .Time, priority: priority)
    }
}

