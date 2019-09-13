class WorldData: Codable {
    let daysElapsed: Int

    let player: PersonData

    init(daysElapsed: Int, player: PersonData) {
        self.daysElapsed = daysElapsed
        self.player = player
    }
}
