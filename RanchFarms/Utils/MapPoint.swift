struct MapPoint: Codable, Hashable, CustomDebugStringConvertible{
    var x: Int
    var y: Int
    var location: Location

    init(x: Int, y: Int, location: Location) {
        self.x = x
        self.y = y
        self.location = location
    }

    init() {
        self.init(x: 0, y: 0, location: Location.House)
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
        hasher.combine(location)
    }

    static func == (lhs: MapPoint, rhs: MapPoint) -> Bool {
        if lhs.x == rhs.x && lhs.y == rhs.y && lhs.location == rhs.location {
            return true
        }
        return false
    }

    var debugDescription: String {
        get {return "(\(x), \(y), \(location))"}
    }
}
