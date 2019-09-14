class TerrainData: Codable {
    let playerIndex: PlayerIndex

    let terrainType: TerrainType
    let mapPoint: MapPoint

    init(playerIndex: PlayerIndex, terrainType: TerrainType, mapPoint: MapPoint) {
        self.playerIndex = playerIndex
        
        self.terrainType = terrainType
        self.mapPoint = mapPoint
    }
}
