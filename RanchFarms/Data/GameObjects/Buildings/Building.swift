import SpriteKit

class Building: GameObject {
    let id: BuildingId
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
        if type == .Crop && growthProgress >= buildingInfo.harvestDate {
            return true
        }
        return false
    }

    init(player: PlayerIndex, buildingId: BuildingId, mapPoint: MapPoint) {
        self.id = buildingId
        self.buildingInfo = BuildingInfoManager.shared.getBuildingInfo(buildingId: buildingId)

        super.init(player: .PlayerOne, mapPoint: mapPoint)

        self.boundarySize = self.buildingInfo.objSize
        // Anchor everything at the center of (0,0) tile
        self.boundaryAnchorPoint = CGPoint(x: 0.5 / self.buildingInfo.objSize.width * Config.tileSize.width,
                                           y: 0.5 / self.buildingInfo.objSize.height * Config.tileSize.height)

        updateTexture()
        self.zPosition = 100
    }

    private func updateTexture() {
        switch type {
        case .Crop:
            if let animation = AnimationManager.shared.getAnimation(building: self) {
                applyAnimationFrame(animation.getFrame(cropProgress: growthProgress))
            }
        default:
            if let animation = AnimationManager.shared.getAnimation(building: self) {
                applyAnimationFrame(animation.getFrame(animationProgress: 0.0))
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
