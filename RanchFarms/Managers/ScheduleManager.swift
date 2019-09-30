import SpriteKit

class ScheduleManager {
    static let shared = ScheduleManager()

    private var scheduleMap = [ScheduleId: Schedule]()

    private init() {
        GameData.GetSchedules().forEach({scheduleMap[$0.id] = $0})
    }

    func getSchedule(scheduleId: ScheduleId) -> Schedule? {
        if scheduleMap[scheduleId] == nil {
            print ("[ScheduleManager] [Desc=Data Not found] [ScheduleId=\(scheduleId)]")
        } else {
            return scheduleMap[scheduleId]
        }
        return nil
    }

    func getScheduleFor(npc: Person, world: World) -> Schedule? {
        var result = [Schedule]()

        for schedule in scheduleMap {
            let validate = CmdValidateRequirements(requirements: schedule.value.requirements, world: world, person: npc)
            validate.execute()

            if validate.success {
                result.append(schedule.value)
            }
        }

        return result.sorted(by: {$0.priority < $1.priority}).first
    }
}
