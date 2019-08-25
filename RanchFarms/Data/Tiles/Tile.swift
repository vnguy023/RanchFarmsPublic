import SpriteKit

class Tile: GameObject {
    private var mType = TileType.Dirt
    var tileType: TileType {
        get {return mType}
        set {
            mType = newValue

            self.texture = TextureManager.shared.getTexture(tileType: newValue)
        }
    }

    var isWatered: Bool {
        get {
            if tileType == .DirtWatered || tileType == .DirtTilledWatered {
                return true
            }
            return false
        }
    }

    init(tileType: TileType, position: CGPoint, location: Location) {
        super.init(position: position, location: location)
        self.tileType = tileType

        self.zPosition = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func water() {
        if tileType == .Dirt {
            tileType = .DirtWatered
        } else if tileType == .DirtTilled {
            tileType = .DirtTilledWatered
        }
    }
}
