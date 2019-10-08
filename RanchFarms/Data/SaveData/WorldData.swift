class WorldData: Codable {
    let gameAreas: [Location: GameAreaData]
    let player: PersonData
    let npcs: [PersonData]

    let memoryBank: MemoryBankData
    let money: Int // Should be readOnly and is derivd from player.money
    let daysElapsed: Int

    let teleportStartDay: TeleportId

    init(gameAreas: [Location: GameAreaData],
         player: PersonData,
         npcs: [PersonData],
         memoryBank: MemoryBankData,
         daysElapsed: Int,
         teleportStartDay: TeleportId) {
        self.gameAreas = gameAreas
        self.player = player
        self.npcs = npcs
        self.memoryBank = memoryBank
        self.money = player.money
        self.daysElapsed = daysElapsed
        self.teleportStartDay = teleportStartDay
    }
}
