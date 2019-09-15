class TileData: Codable {
    let playerIndex: PlayerIndex
    let tileType: TileType
    let mapPoint: MapPoint

    init(playerIndex: PlayerIndex, tileType: TileType, mapPoint: MapPoint) {
        self.playerIndex = playerIndex
        self.tileType = tileType
        self.mapPoint = mapPoint
    }
}
