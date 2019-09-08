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

    var isWatered: Bool {
        get {
            if type == .DirtWatered || type == .DirtTilledWatered {
                return true
            }
            return false
        }
    }

    init(tileType: TileType, mapPoint: MapPoint) {
        super.init(mapPoint: mapPoint)
        self.type = tileType

        self.zPosition = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func water() {
        if type == .Dirt {
            type = .DirtWatered
        } else if type == .DirtTilled {
            type = .DirtTilledWatered
        }
    }
}
