import SpriteKit

class Tile: GameObject {
    let type: TileType

    init(tileType: TileType, mapPoint: MapPoint) {
        self.type = tileType

        super.init(player: .Game, mapPoint: mapPoint)
        self.player = player

        self.zPosition = 0

        updateTexture()
    }

    private func updateTexture() {
        applyTexture(TextureManager.shared.getTexture(tileType: type))
    }

    func getTileData() -> TileData {
        return TileData(playerIndex: player, tileType: type, mapPoint: mapPoint)
    }

    convenience init(data: TileData) {
        self.init(tileType: data.tileType, mapPoint: data.mapPoint)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
