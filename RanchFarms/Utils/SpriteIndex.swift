import SpriteKit

enum SpriteIndex: UInt, Codable {
    // assuming 4x4 grid -- arranged in a certain way

    // name -- Neighbors on _,_,_,_
    case Orphan = 0 // NONE

    case Center = 6 // NWSE

    case North = 2// SWE
    case South = 10// NWE
    case West = 5 // NSE
    case East = 7 // NSW

    case Corner_NW = 1 // SE
    case Corner_NE = 3// SW
    case Corner_SW = 9// NE
    case Corner_SE = 11// NW

    case U_North = 12 // N
    case U_South = 4 // S
    case U_West = 15// W
    case U_East = 13// E

    case Opposite_Vertical = 8// NS
    case Opposite_Horizontal = 14 // WE

    case ICorner_NW = 16 // -- occupie same space as 12
    case ICorner_NE = 17 // -- occupie same space as 13
    case ICorner_SW = 18 // -- occupie same space as 14
    case ICorner_SE = 19 // -- occupie same space as 15

    func getRect() -> CGRect {
        switch self {
        case .Orphan:
            return CGRect(origin: CGPoint(x: 0, y: 0.75), size: CGSize(width: 0.25, height: 0.25))
        case .Corner_NW:
            return CGRect(origin: CGPoint(x: 0.25, y: 0.75), size: CGSize(width: 0.25, height: 0.25))
        case .North:
            return CGRect(origin: CGPoint(x: 0.5, y: 0.75), size: CGSize(width: 0.25, height: 0.25))
        case .Corner_NE:
            return CGRect(origin: CGPoint(x: 0.75, y: 0.75), size: CGSize(width: 0.25, height: 0.25))

        case .U_South:
            return CGRect(origin: CGPoint(x: 0, y: 0.5), size: CGSize(width: 0.25, height: 0.25))
        case .West:
            return CGRect(origin: CGPoint(x: 0.25, y: 0.5), size: CGSize(width: 0.25, height: 0.25))
        case .Center:
            return CGRect(origin: CGPoint(x: 0.5, y: 0.5), size: CGSize(width: 0.25, height: 0.25))
        case .East:
            return CGRect(origin: CGPoint(x: 0.75, y: 0.5), size: CGSize(width: 0.25, height: 0.25))

        case .Opposite_Vertical:
            return CGRect(origin: CGPoint(x: 0, y: 0.25), size: CGSize(width: 0.25, height: 0.25))
        case .Corner_SW:
            return CGRect(origin: CGPoint(x: 0.25, y: 0.25), size: CGSize(width: 0.25, height: 0.25))
        case .South:
            return CGRect(origin: CGPoint(x: 0.5, y: 0.25), size: CGSize(width: 0.25, height: 0.25))
        case .Corner_SE:
            return CGRect(origin: CGPoint(x: 0.75, y: 0.25), size: CGSize(width: 0.25, height: 0.25))

        case .U_North: fallthrough
        case .ICorner_NW:
            return CGRect(origin: CGPoint(x: 0, y: 0), size: CGSize(width: 0.25, height: 0.25))
        case .U_West: fallthrough
        case .ICorner_NE:
            return CGRect(origin: CGPoint(x: 0.25, y: 0), size: CGSize(width: 0.25, height: 0.25))
        case .Opposite_Horizontal: fallthrough
        case .ICorner_SW:
            return CGRect(origin: CGPoint(x: 0.5, y: 0), size: CGSize(width: 0.25, height: 0.25))
        case .U_East: fallthrough
        case .ICorner_SE:
            return CGRect(origin: CGPoint(x: 0.75, y: 0), size: CGSize(width: 0.25, height: 0.25))
        }
    }

    // must pass in absolutes
    static func getSpriteIndex(neighbors: Set<CGVector>) -> SpriteIndex {
        if neighbors == Set<CGVector>([CGVector.NORTH, CGVector.SOUTH,
                                       CGVector.WEST, CGVector.EAST]) {
            return .Center
        }

        if neighbors == Set<CGVector>([CGVector.NORTH]) {
            return .U_North
        } else if neighbors == Set<CGVector>([CGVector.SOUTH]) {
            return .U_South
        } else if neighbors == Set<CGVector>([CGVector.WEST]) {
            return .U_West
        } else if neighbors == Set<CGVector>([CGVector.EAST]) {
            return .U_East
        }

        if neighbors == Set<CGVector>([CGVector.NORTH, CGVector.WEST]) {
            return .Corner_SE
        } else if neighbors == Set<CGVector>([CGVector.NORTH, CGVector.EAST]) {
            return .Corner_SW
        } else if neighbors == Set<CGVector>([CGVector.SOUTH, CGVector.WEST]) {
            return .Corner_NE
        } else if neighbors == Set<CGVector>([CGVector.SOUTH, CGVector.EAST]) {
            return .Corner_NW
        }

        if neighbors == Set<CGVector>([CGVector.SOUTH, CGVector.WEST, CGVector.EAST]) {
            return .North
        } else if neighbors == Set<CGVector>([CGVector.NORTH, CGVector.WEST, CGVector.EAST]) {
            return .South
        } else if neighbors == Set<CGVector>([CGVector.NORTH, CGVector.SOUTH, CGVector.EAST]) {
            return .West
        } else if neighbors == Set<CGVector>([CGVector.NORTH, CGVector.SOUTH, CGVector.WEST]) {
            return .East
        }

        if neighbors == Set<CGVector>([CGVector.NORTH, CGVector.SOUTH]) {
            return .Opposite_Vertical
        } else if neighbors == Set<CGVector>([CGVector.WEST, CGVector.EAST]) {
            return .Opposite_Horizontal
        }

        return .Orphan
    }

    static func getSpriteIndexWall(neighbors: Set<CGVector>) -> SpriteIndex {
        if neighbors == Set<CGVector>([CGVector.NORTH]) {
            return .South
        } else if neighbors == Set<CGVector>([CGVector.SOUTH]) {
            return .North
        } else if neighbors == Set<CGVector>([CGVector.WEST]) {
            return .East
        } else if neighbors == Set<CGVector>([CGVector.EAST]) {
            return .West
        }

        if neighbors == Set<CGVector>([CGVector.NORTH, CGVector.WEST]) {
            return .ICorner_SE
        } else if neighbors == Set<CGVector>([CGVector.NORTH, CGVector.EAST]) {
            return .ICorner_SW
        } else if neighbors == Set<CGVector>([CGVector.SOUTH, CGVector.WEST]) {
            return .ICorner_NE
        } else if neighbors == Set<CGVector>([CGVector.SOUTH, CGVector.EAST]) {
            return .ICorner_NW
        }

        return .Orphan
    }
}
