class GameAreaData: Codable {
    let location: Location

    let buildings: [BuildingData]
    let terrains: [TerrainData]
    let tiles: [TileData]

    let people: [PersonData]

    init(location: Location, buildings: [BuildingData], terrains: [TerrainData], tiles: [TileData], people: [PersonData]) {
        self.location = location
        
        self.buildings = buildings
        self.terrains = terrains
        self.tiles = tiles
        self.people = people
    }
}
