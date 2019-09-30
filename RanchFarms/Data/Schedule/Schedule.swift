import SpriteKit

class Schedule{
    let id: ScheduleId
    let priority: Int // higher the number higher priority

    let requirements: [Requirement]

    let scheduleEvents: [ScheduleEvent]

    init(scheduleId: ScheduleId, priority: Int, requirements: [Requirement], scheduleEvents: [ScheduleEvent]) {
        self.id = scheduleId
        self.priority = priority

        self.requirements = requirements
        self.scheduleEvents = scheduleEvents.sorted(by: {$0.startTime < $1.startTime})
    }

    func getCurrentEvent(currentTime: GameTick) -> ScheduleEvent?{
        return scheduleEvents.filter({$0.startTime <= currentTime}).last
    }
}
