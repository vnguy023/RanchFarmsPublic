enum SaveSlot {
    case Slot1
    case Slot2
    case Slot3

    case Temp

    func getFileName() -> String {
        switch self {
            case .Slot1: return Config.SaveFileName1
            case .Slot2: return Config.SaveFileName2
            case .Slot3: return Config.SaveFileName3
            case .Temp: return Config.SaveFileNameTemp
        }
    }
}
