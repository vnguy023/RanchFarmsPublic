class CmdValidateRequirements: Command {
    // Input
    let requirements: [Requirement]

    // Output
    var success = false

    init(requirements: [Requirement]) {
        self.requirements = requirements
    }

    func execute() {
        for requirement in requirements {
            if isMet(requirement: requirement) {

            } else {
                break
            }
        }
        success = true
    }

    private func isMet(requirement: Requirement) -> Bool {
        return true
    }
}
