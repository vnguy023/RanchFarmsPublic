class TileData: Codable {
    let tileId: TileId
    let mapPoint: MapPoint

    init(tileId: TileId, mapPoint: MapPoint) {
        self.tileId = tileId
        self.mapPoint = mapPoint
    }
}
