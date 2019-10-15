enum ItemId: UInt, Codable {
    case Unknown = 0
    
    case Axe = 100
    case FishingPole
    case Hammer
    case Hoe
    case PickAxe
    case Sickle
    case WaterCan

    case Sword = 200

    // Crops
    case GarlicSeed = 1000
    case Garlic
    case TurnipSeed
    case Turnip

    // Fish
    case Crab = 2000
}
