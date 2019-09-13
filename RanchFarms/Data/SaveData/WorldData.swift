class WorldData: Codable {
    let daysElapsed: Int

    let player: PersonData

    let buildings: [BuildingData]

    init(daysElapsed: Int, player: PersonData, buildings: [BuildingData]) {
        self.daysElapsed = daysElapsed
        self.player = player
        self.buildings = buildings
    }
}
