import SpriteKit

class Building: GameObject {
    let buildingId: BuildingId
    var type: BuildingType {
        get {return buildingInfo.buildingType}
    }

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
    var canHarvest: Bool {
        if type == .Crop && growthProgress >= buildingInfo.harvestDate! {
            return true
        }
        return false
    }

    init(buildingId: BuildingId, mapPoint: MapPoint) {
        self.buildingId = buildingId
        self.buildingInfo = BuildingInfoManager.shared.getBuildingInfo(buildingId: buildingId)

        super.init(mapPoint: mapPoint)

        updateTexture()
        self.zPosition = 100
    }

    private func updateTexture() {
        if buildingInfo.growthTextureMap == nil {
            applyTexture(TextureManager.shared.getTexture(buildingId: buildingId)) 
        } else {
            var textureName = "\(buildingInfo.name)"
            for i in 0...mGrowthProgress {
                if let temp = buildingInfo.growthTextureMap![i] {
                    textureName = temp
                }
            }
            applyTexture(TextureManager.shared.getTexture(cropName: textureName))
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
