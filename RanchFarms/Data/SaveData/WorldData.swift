class WorldData: Codable {
    let gameAreas: [Location: GameAreaData]
    let player: PersonData

    let daysElapsed: Int

    init(gameAreas: [Location: GameAreaData],
         player: PersonData,
         daysElapsed: Int) {
        self.gameAreas = gameAreas
        self.player = player
        self.daysElapsed = daysElapsed
    }
}
