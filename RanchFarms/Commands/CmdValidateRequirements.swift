class CmdValidateRequirements: Command {
    // Input
    let requirements: [Requirement]
    let world: World
    let person: Person!

    // Output
    var success = false

    // Helpers
    var currentTime: GameTick{ get {return world.gameTicksElapsedToday}}
    var currentWeekDay: DayId{ get {return world.getCurrentWeekDay()}}

    init(requirements: [Requirement], world: World, person: Person?) {
        self.requirements = requirements

        self.world = world
        self.person = person
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
        case .Day:
            if requirement.dayId == currentWeekDay {
                return true
            }
        case .NPC:
            if requirement.personId == person.id {
                return true
            }
        }

        return false
    }
}
