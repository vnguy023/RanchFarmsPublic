enum RequirementType: UInt, Codable {
    case Time
    case NPC
    case Day
    case HasSeenDialogId
    case HasNotSeenDialogId
    case HasSeenGameEventId
    case HasNotSeenGameEventId
}

