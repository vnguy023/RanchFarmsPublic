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

    init(tileType: TileType, mapPoint: MapPoint) {
        super.init(player: .Game, mapPoint: mapPoint)
        self.type = tileType

        self.zPosition = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
