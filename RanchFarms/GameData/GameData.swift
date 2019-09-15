class GameData {
    static func BasicHouse() -> GameAreaData {
        let location = Location.House

        var buildings = [BuildingData]()
        var terrains = [TerrainData]()
        var tiles = [TileData]()

        let door = BuildingData(playerIndex: .Game,
                                buildingId: .HouseToFarmDoor,
                                mapPoint: MapPoint(x: 1, y: -2, location: location))
        buildings.append(door)

        let bed = BuildingData(playerIndex: .Game,
                               buildingId: .SingleBed,
                               mapPoint: MapPoint(x: 8, y: 0, location: location))
        buildings.append(bed)

        // Tiles/Terrains
        for x in 0...9 {
            for y in 0...6 {
                let tile = TileData(playerIndex: .Game,
                                    tileType: .Dirt,
                                    mapPoint: MapPoint(x: x, y: y, location: location))
                tiles.append(tile)

                let terrain = TerrainData(playerIndex: .Game,
                                          terrainType: .Wood,
                                          mapPoint: MapPoint(x: x, y: y, location: location))
                terrains.append(terrain)
            }
        }

        return GameAreaData(location: location, buildings: buildings, terrains: terrains, tiles: tiles)
    }
}
