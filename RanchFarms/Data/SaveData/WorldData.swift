class WorldData: Codable {
    let gameAreas: [Location: GameAreaData]
    let player: PersonData

    let daysElapsed: Int

    let teleportStartDay: TeleportId

    init(gameAreas: [Location: GameAreaData],
         player: PersonData,
         daysElapsed: Int,
         teleportStartDay: TeleportId) {
        self.gameAreas = gameAreas
        self.player = player
        self.daysElapsed = daysElapsed
        self.teleportStartDay = teleportStartDay
    }
}
