import SpriteKit

extension GameData {

    static func getTeleports() -> [Teleport] {
        var data = [Teleport]()

        data.append(contentsOf: getTeleportsSceneTransitions())

        return data
    }

    static private func getTeleportsSceneTransitions() -> [Teleport] {
        var data = [Teleport]()

        data.append(Teleport(teleportId: .House_Bed,
                             mapPoint: MapPoint(x: 7, y: 1, location: Location(gameAreaId: .House)),
                             directionToFace: .SOUTH))
        data.append(Teleport(teleportId: .House_Farm,
                             mapPoint: MapPoint(x: 3, y: 6, location: Location(gameAreaId: .Farm)),
                             directionToFace: .SOUTH))
        data.append(Teleport(teleportId: .Farm_House,
                             mapPoint: MapPoint(x: 1, y: 0, location: Location(gameAreaId: .House)),
                             directionToFace: .NORTH))
        data.append(Teleport(teleportId: .Farm_Town,
                             mapPoint: MapPoint(x: 0, y: 0, location: Location(gameAreaId: .Town)),
                             directionToFace: .EAST))
        data.append(Teleport(teleportId: .GeneralStore_Town,
                             mapPoint: MapPoint(x: 2, y: 5, location: Location(gameAreaId: .Town)),
                             directionToFace: .SOUTH))
        data.append(Teleport(teleportId: .JamesHouse_Town,
                             mapPoint: MapPoint(x: 8, y: 5, location: Location(gameAreaId: .Town)),
                             directionToFace: .SOUTH))
        data.append(Teleport(teleportId: .SouthBeach_Town,
                             mapPoint: MapPoint(x: 4, y: -5, location: Location(gameAreaId: .Town)),
                             directionToFace: .NORTH))
        data.append(Teleport(teleportId: .SouthBeach_DungeonEntrance,
                             mapPoint: MapPoint(x: 1, y: 0, location: Location(gameAreaId: .Dungeon)),
                             directionToFace: .NORTH))
        data.append(Teleport(teleportId: .Town_Farm,
                             mapPoint: MapPoint(x: 5, y: 3, location: Location(gameAreaId: .Farm)),
                             directionToFace: .WEST))
        data.append(Teleport(teleportId: .Town_GeneralStore,
                             mapPoint: MapPoint(x: 1, y: 0, location: Location(gameAreaId: .General_Store)),
                             directionToFace: .NORTH))
        data.append(Teleport(teleportId: .Town_JamesHouse,
                             mapPoint: MapPoint(x: 1, y: 0, location: Location(gameAreaId: .James_House)),
                             directionToFace: .NORTH))
        data.append(Teleport(teleportId: .Town_SouthBeach,
                             mapPoint: MapPoint(x: 4, y: 0, location: Location(gameAreaId: .South_Beach)),
                             directionToFace: .SOUTH))
        data.append(Teleport(teleportId: .DungeonEntrance_SouthBeach,
                             mapPoint: MapPoint(x: 8, y: 0, location: Location(gameAreaId: .South_Beach)),
                             directionToFace: .SOUTH))

        return data
    }
}

