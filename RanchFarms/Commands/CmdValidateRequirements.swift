class CmdValidateRequirements: Command {
    // Input
    let requirements: [Requirement]
    let currentTime: GameTick

    // Output
    var success = false

    init(requirements: [Requirement], currentTime: GameTick) {
        self.requirements = requirements

        self.currentTime = currentTime
    }

    func execute() {
        for requirement in requirements {
            if !isMet(requirement: requirement) {
                return
            }
        }
        success = true
    }

    private func isMet(requirement: Requirement) -> Bool {
        switch requirement.type {
        case .Time:
            if requirement.startTime <= currentTime && currentTime <= requirement.endTime {
                return true
            }
        }

        return false
    }
}
