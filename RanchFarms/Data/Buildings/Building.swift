import SpriteKit

class Building: GameObject {
    let buildingId: BuildingId

    let buildingInfo: BuildingInfo!

    var teleport: Teleport?

    // Mainly Crops
    private var mGrowthProgress = Int(0) // goes form 0-100
    var growthProgress: Int {
        get { return mGrowthProgress }
        set { mGrowthProgress = newValue
            updateTexture()
        }
    }

    init(buildingId: BuildingId, position: CGPoint, location: Location) {
        self.buildingId = buildingId
        self.buildingInfo = BuildingInfoManager.shared.getBuildingInfo(buildingId: buildingId)

        super.init(position: position, location: location)

        updateTexture()
        self.zPosition = 100
    }

    private func updateTexture() {
        if buildingInfo.growthTextureMap == nil {
            self.texture = TextureManager.shared.getTexture(buildingId: buildingId)
        } else {
            var textureName = "\(buildingInfo.name)"
            for i in 0...mGrowthProgress {
                if let temp = buildingInfo.growthTextureMap![i] {
                    textureName = temp
                }
            }
            self.texture = TextureManager.shared.getTexture(cropName: textureName)
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
