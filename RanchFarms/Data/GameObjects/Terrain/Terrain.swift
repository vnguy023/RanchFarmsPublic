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
            } else {
                return false
            }
        }
        set {
            // no way to set terrain from dirt <-> watered this way
            if newValue == true {
                if type == .Tilled {
                    type = .TilledWatered
                }
            } else {
                if type == .TilledWatered {
                    type = .Tilled
                }
            }
        }
    }

    init(player: PlayerIndex, terrainType: TerrainType, mapPoint: MapPoint) {
        super.init(player: player, mapPoint: mapPoint)

        self.type = terrainType

        self.zPosition = 50
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
