import SpriteKit

class Location: Hashable, Equatable, Codable {
    var gameAreaId: GameAreaId
    var level: UInt

    init(gameAreaId: GameAreaId, level: UInt) {
        self.gameAreaId = gameAreaId
        self.level = level
    }

    convenience init(gameAreaId: GameAreaId) {
        self.init(gameAreaId: gameAreaId, level: 1)
    }

    convenience init() {
        self.init(gameAreaId: .House, level: 1)
    }

    static func == (lhs: Location, rhs: Location) -> Bool {
        if lhs.gameAreaId == rhs.gameAreaId && lhs.level == rhs.level {
            return true
        }

        return false
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(gameAreaId)
        hasher.combine(level)
    }
}
