import SpriteKit

class Tile: GameObject {
    private var mType = TileType.Dirt
    var type: TileType {
        get {return mType}
        set {
            mType = newValue

            applyTexture(TextureManager.shared.getTexture(tileType: newValue))
        }
    }

    init(player: PlayerIndex, tileType: TileType, mapPoint: MapPoint) {
        super.init(player: .Game, mapPoint: mapPoint)
        self.player = player
        self.type = tileType

        self.zPosition = 0
    }

    func getTileData() -> TileData {
        return TileData(playerIndex: player, tileType: type, mapPoint: mapPoint)
    }

    convenience init(data: TileData) {
        self.init(player: data.playerIndex, tileType: data.tileType, mapPoint: data.mapPoint)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
