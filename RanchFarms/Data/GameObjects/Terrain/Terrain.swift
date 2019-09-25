import SpriteKit

class Terrain: GameObject {
    private var mType = TerrainType.Tilled
    var type: TerrainType {
        get {return mType}
        set {
            mType = newValue
            applyTexture(TextureManager.shared.getTexture(terrainType: newValue))
        }
    }

    var isWatered: Bool {
        get {
            if type == .TilledWatered || type == .Watered {
                return true
            }
            return false
        }
    }

    var isTilled: Bool {
        get {
            if type == .TilledWatered || type == .Tilled {
                return true
            }
            return false
        }
    }

    override var zOffset: CGFloat { return 1000 }

    init(player: PlayerIndex, terrainType: TerrainType, mapPoint: MapPoint) {
        super.init(player: player, mapPoint: mapPoint)

        self.boundarySize = Config.tileSize
        // Anchor everything at the center of (0,0) tile
        self.boundaryAnchorPoint = CGPoint(x: 0.5, y: 0.5)
        self.isBlocking = false

        self.type = terrainType
    }

    convenience init(data: TerrainData) {
        self.init(player: data.playerIndex, terrainType: data.terrainType, mapPoint: data.mapPoint)
    }

    func getTerrainData() -> TerrainData {
        return TerrainData(playerIndex: player, terrainType: type, mapPoint: mapPoint)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
