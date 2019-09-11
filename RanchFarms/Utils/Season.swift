enum Season: UInt, Codable {
    case Spring = 0
    case Summer
    case Autumn
    case Winter

    func toString() -> String {
        switch self {
        case .Spring: return "Spring"
        case .Summer: return "Summer"
        case .Autumn: return "Autumn"
        case .Winter: return "Winter"
        }
    }
}
