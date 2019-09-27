import SpriteKit

extension GameData {

    static func getTeleports() -> [Teleport] {
        var data = [Teleport]()

        data.append(contentsOf: getTeleportsSceneTransitions())
        data.append(contentsOf: getTeleportsLily())

        return data
    }

    static private func getTeleportsSceneTransitions() -> [Teleport] {
        var data = [Teleport]()

        data.append(Teleport(teleportId: .House_Bed,
                             mapPoint: MapPoint(x: 7, y: 1, location: .House),
                             directionToFace: .SOUTH))
        data.append(Teleport(teleportId: .House_Farm,
                             mapPoint: MapPoint(x: 3, y: 6, location: .Farm),
                             directionToFace: .SOUTH))
        data.append(Teleport(teleportId: .Farm_House,
                             mapPoint: MapPoint(x: 1, y: 0, location: .House),
                             directionToFace: .NORTH))
        data.append(Teleport(teleportId: .Farm_Town,
                             mapPoint: MapPoint(x: 0, y: 0, location: .Town),
                             directionToFace: .EAST))
        data.append(Teleport(teleportId: .GeneralStore_Town,
                             mapPoint: MapPoint(x: 2, y: 5, location: .Town),
                             directionToFace: .SOUTH))
        data.append(Teleport(teleportId: .SouthBeach_Town,
                             mapPoint: MapPoint(x: 4, y: -5, location: .Town),
                             directionToFace: .NORTH))
        data.append(Teleport(teleportId: .Town_Farm,
                             mapPoint: MapPoint(x: 5, y: 3, location: .Farm),
                             directionToFace: .WEST))
        data.append(Teleport(teleportId: .Town_GeneralStore,
                             mapPoint: MapPoint(x: 1, y: 0, location: .GeneralStore),
                             directionToFace: .NORTH))
        data.append(Teleport(teleportId: .Town_SouthBeach,
                             mapPoint: MapPoint(x: 4, y: 0, location: .SouthBeach),
                             directionToFace: .SOUTH))

        return data
    }

    static private func getTeleportsLily() -> [Teleport] {
        var data = [Teleport]()

        data.append(Teleport(teleportId: .Lily_Spawn,
                             mapPoint: MapPoint(x: 3, y: 3, location: .Town),
                             directionToFace: .SOUTH))

        return data
    }
}

