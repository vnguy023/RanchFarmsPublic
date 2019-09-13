class BuildingData: Codable {
    let playerIndex: PlayerIndex
    let id: BuildingId
    let mapPoint: MapPoint
    let inventory: InventoryData

    let growthProgress: Int

    init(playerIndex: PlayerIndex, buildingId: BuildingId, mapPoint: MapPoint, inventory: InventoryData, growthProgress: Int) {
        self.playerIndex = playerIndex
        self.id = buildingId
        self.mapPoint = mapPoint
        self.inventory = inventory

        self.growthProgress = growthProgress
    }
}
