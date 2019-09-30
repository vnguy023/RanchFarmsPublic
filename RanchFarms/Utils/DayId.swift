enum DayId: UInt, Codable {
    case Sunday, Monday, Tuesday, Wednesday, Thursday, Friday, Saturday

    func getString() -> String {
        switch self {
        case .Sunday:
            return "SUN"
        case .Monday:
            return "MON"
        case .Tuesday:
            return "TUE"
        case .Wednesday:
            return "WED"
        case .Thursday:
            return "THU"
        case .Friday:
            return "FRI"
        case .Saturday:
            return "SAT"
        }
    }

    static func getDayId(_ dayNumber: UInt) -> DayId {
        return DayId(rawValue: dayNumber % 7)!
    }

    func isWeekday() -> Bool {
        switch self {
        case .Monday: fallthrough
        case .Tuesday: fallthrough
        case .Wednesday: fallthrough
        case .Thursday: fallthrough
        case .Friday:
            return true
        default:
            return false
        }
    }
}

