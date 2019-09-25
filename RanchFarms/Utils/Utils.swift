import SpriteKit

typealias GameTick = UInt

extension CGPoint: Hashable {
    public func hash(into hasher: inout Hasher) {
        hasher.combine(x)
        hasher.combine(y)
    }
}

extension CGPoint
{
    static func + (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }

    static func - (lhs: CGPoint, rhs: CGPoint) -> CGPoint {
        return CGPoint(x: lhs.x - rhs.x, y: lhs.y - rhs.y)
    }

    func distance(_ otherPoint: CGPoint) -> CGFloat {
        return sqrt(pow(self.x-otherPoint.x,2)+pow(self.y-otherPoint.y,2));
    }

    func scale(_ value: CGFloat) -> CGPoint {
        var result = self
        result.x *= value
        result.y *= value
        return result
    }

    static func + (lhs: CGPoint, rhs: CGVector) -> CGPoint{
        return CGPoint(x: lhs.x + rhs.dx, y: lhs.y + rhs.dy)
    }

    static func - (lhs: CGPoint, rhs: CGVector) -> CGPoint{
        return CGPoint(x: lhs.x - rhs.dx, y: lhs.y - rhs.dy)
    }
}

extension CGSize {
    func scale(_ value: CGFloat) -> CGSize {
        var result = self
        result.width *= value
        result.height *= value
        return result
    }

    func scale(_ value: Int) -> CGSize {
        var result = self
        result.width *= CGFloat(value)
        result.height *= CGFloat(value)
        return result
    }
}

extension CGVector: Hashable {
    static let NORTH = CGVector(dx: 0, dy: 1)
    static let SOUTH = CGVector(dx: 0, dy: -1)
    static let WEST = CGVector(dx: -1, dy: 0)
    static let EAST = CGVector(dx: 1, dy: 0)

    static let NORTHWEST = CGVector(dx: -1, dy: 1)
    static let NORTHEAST = CGVector(dx: 1, dy: 1)
    static let SOUTHWEST = CGVector(dx: -1, dy: -1)
    static let SOUTHEAST = CGVector(dx: 1, dy: -1)

    init(pointA: CGPoint, pointB: CGPoint) {
        self.init(dx: pointB.x - pointA.x, dy: pointB.y - pointA.y)
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(dx)
        hasher.combine(dy)
    }

    func getMagnitude() -> CGFloat {
        return sqrt(self.dx * self.dx + self.dy * self.dy)
    }

    func normalize() -> CGVector{
        var retval = CGVector(dx: 0, dy: 0)

        let temp = sqrt(self.dx * self.dx + self.dy * self.dy)
        if temp == 0 {
            return retval
        }

        retval.dx = self.dx/temp
        retval.dy = self.dy/temp
        return retval
    }

    func scale(_ value: CGFloat) -> CGVector {
        return CGVector(dx: self.dx * value, dy: self.dy * value)
    }

    func angleRadians() -> CGFloat {
        if isZeroVector {
            return CGFloat.pi / -2
        }

        if self.dy >= 0 {
            return acos(self.normalize().dx)
        } else {
            return acos(self.normalize().dx) * -1 + CGFloat.pi * 2
        }
    }

    var isZeroVector: Bool {
        get {
            if self.dx == 0 && self.dy == 0 { return true }
            return false
        }
    }

    static func getDirection4(start: CGPoint, end: CGPoint) -> CGVector {
        let vector = CGVector(pointA: start, pointB: end)

        let angleRad = vector.angleRadians()

        if angleRad <= CGFloat.pi * 0.25 || angleRad > CGFloat.pi * 1.75 {
            return .EAST
        } else if angleRad <= CGFloat.pi * 0.75 || angleRad < CGFloat.pi * 0.25 {
            return .NORTH
        } else if angleRad <= CGFloat.pi * 1.25 || angleRad < CGFloat.pi * 0.75 {
            return .WEST
        } else if angleRad <= CGFloat.pi * 1.75 || angleRad < CGFloat.pi * 1.25 {
            return .SOUTH
        }

        // default value
        return CGVector.NORTH
    }

    static func getDirection8(start: CGPoint, end: CGPoint) -> CGVector {
        let vector = CGVector(pointA: start, pointB: end)

        let angleRad = vector.angleRadians()

        if angleRad < CGFloat.pi * 0.125 || angleRad >= CGFloat.pi * 1.875 {
            return .EAST
        } else if CGFloat.pi * 0.125 <= angleRad && angleRad < CGFloat.pi * 0.375{
            return .NORTHEAST
        } else if CGFloat.pi * 0.375 <= angleRad && angleRad < CGFloat.pi * 0.625{
            return .NORTH
        } else if CGFloat.pi * 0.625 <= angleRad && angleRad < CGFloat.pi * 0.875{
            return .NORTHWEST
        } else if CGFloat.pi * 0.875 <= angleRad && angleRad < CGFloat.pi * 1.125{
            return .WEST
        } else if CGFloat.pi * 1.125 <= angleRad && angleRad < CGFloat.pi * 1.375{
            return .SOUTHWEST
        } else if CGFloat.pi * 1.375 <= angleRad && angleRad < CGFloat.pi * 1.625{
            return .SOUTH
        } else if CGFloat.pi * 1.625 <= angleRad && angleRad < CGFloat.pi * 1.875{
            return .SOUTHEAST
        }

        // default value
        return CGVector.NORTH
    }
}
