class WorldData: Codable {
    let gameAreas: [Location: GameAreaData]
    let player: PersonData

    let money: Int // Should be readOnly and is derivd from player.money
    let daysElapsed: Int

    let teleportStartDay: TeleportId

    init(gameAreas: [Location: GameAreaData],
         player: PersonData,
         daysElapsed: Int,
         teleportStartDay: TeleportId) {
        self.gameAreas = gameAreas
        self.player = player
        self.money = player.money
        self.daysElapsed = daysElapsed
        self.teleportStartDay = teleportStartDay
    }
}
