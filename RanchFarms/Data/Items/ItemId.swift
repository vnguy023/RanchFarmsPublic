enum ItemId: UInt, Codable {
    case Unknown = 0
    
    case Axe = 100
    case FishingPole
    case Hammer
    case Hoe
    case PickAxe
    case Sickle
    case WaterCan

    // Crops
    case GarlicSeed = 1000
    case Garlic
    case TurnipSeed
    case Turnip
}
