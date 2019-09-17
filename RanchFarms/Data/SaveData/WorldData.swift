class WorldData: Codable {
    let gameAreas: [Location: GameAreaData]
    let player: PersonData

    let money: Int
    let daysElapsed: Int

    let teleportStartDay: TeleportId

    init(gameAreas: [Location: GameAreaData],
         player: PersonData,
         money: Int,
         daysElapsed: Int,
         teleportStartDay: TeleportId) {
        self.gameAreas = gameAreas
        self.player = player
        self.money = money
        self.daysElapsed = daysElapsed
        self.teleportStartDay = teleportStartDay
    }
}
