class TileData: Codable {
    let tileId: TileId
    let tileType: TileType
    let mapPoint: MapPoint

    init(tileId: TileId, tileType: TileType, mapPoint: MapPoint) {
        self.tileId = tileId
        self.tileType = tileType
        self.mapPoint = mapPoint
    }
}
