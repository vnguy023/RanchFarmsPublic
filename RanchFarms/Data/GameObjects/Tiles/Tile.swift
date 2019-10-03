import SpriteKit

class Tile: GameObject {
    let id: TileId
    var type: TileType {
        get { return info.tileType }
    }

    let info: TileInfo!

    init(tileId: TileId, mapPoint: MapPoint) {
        self.id = tileId
        self.info = TileInfoManager.shared.getTileInfo(tileId: tileId)

        super.init(player: .Game, mapPoint: mapPoint)
        self.player = player

        self.zPosition = 0

        self.boundarySize = Config.tileSize
        // Anchor everything at the center of (0,0) tile
        self.boundaryAnchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.hasSpriteIndices = info.hasSpriteIndices
        self.isBlocking = info.isBlocking

        updateTexture()
    }

    private func updateTexture() {
        applyTexture(TextureManager.shared.getTexture(tileId: id))
    }

    func getTileData() -> TileData {
        return TileData(tileId: id, mapPoint: mapPoint)
    }

    convenience init(data: TileData) {
        self.init(tileId: data.tileId, mapPoint: data.mapPoint)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
