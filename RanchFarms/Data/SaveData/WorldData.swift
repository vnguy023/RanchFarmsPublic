class WorldData: Codable {
    let daysElapsed: Int

    let player: PersonData

    let buildings: [BuildingData]
    let terrains: [TerrainData]

    init(daysElapsed: Int, player: PersonData, buildings: [BuildingData], terrains: [TerrainData]) {
        self.daysElapsed = daysElapsed
        self.player = player
        self.buildings = buildings
        self.terrains = terrains
    }
}
