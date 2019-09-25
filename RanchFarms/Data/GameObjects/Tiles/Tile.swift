import SpriteKit

class Tile: GameObject {
    let id: TileId
    let type: TileType

    init(tileId: TileId, tileType: TileType, mapPoint: MapPoint) {
        self.id = tileId
        self.type = tileType

        super.init(player: .Game, mapPoint: mapPoint)
        self.player = player

        self.zPosition = 0

        updateTexture()
    }

    private func updateTexture() {
        applyTexture(TextureManager.shared.getTexture(tileId: id))
    }

    func getTileData() -> TileData {
        return TileData(tileId: id, tileType: type, mapPoint: mapPoint)
    }

    convenience init(data: TileData) {
        self.init(tileId: data.tileId, tileType: data.tileType, mapPoint: data.mapPoint)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
