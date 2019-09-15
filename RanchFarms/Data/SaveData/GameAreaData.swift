class GameAreaData: Codable {
    let location: Location

    let buildings: [BuildingData]
    let terrains: [TerrainData]
    let tiles: [TileData]

    init(location: Location, buildings: [BuildingData], terrains: [TerrainData], tiles: [TileData]) {
        self.location = location
        
        self.buildings = buildings
        self.terrains = terrains
        self.tiles = tiles
    }
}
