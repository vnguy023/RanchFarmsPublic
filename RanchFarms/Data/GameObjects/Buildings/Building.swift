import SpriteKit

class Building: GameObject {
    let id: BuildingId
    var type: BuildingType {
        get {return buildingInfo.buildingType}
    }

    let buildingInfo: BuildingInfo!

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

    // slightly off from person to to make movement left <-> right consistent
    override var zOffset: CGFloat { return 1999 }

    init(player: PlayerIndex, buildingId: BuildingId, mapPoint: MapPoint) {
        self.id = buildingId
        self.buildingInfo = BuildingInfoManager.shared.getBuildingInfo(buildingId: buildingId)

        super.init(player: player, mapPoint: mapPoint)

        self.boundarySize = self.buildingInfo.objSize
        self.boundaryAnchorPoint = CGPoint(x: 0.5 / self.buildingInfo.objSize.width * Config.tileSize.width,
                                           y: 0.5 / self.buildingInfo.objSize.height * Config.tileSize.height)
        self.isBlocking = buildingInfo.isBlocking

        updateTexture()
    }

    convenience init(data: BuildingData) {
        self.init(player: data.playerIndex, buildingId: data.buildingId, mapPoint: data.mapPoint)
        self.inventory = Inventory(data: data.inventory)
        self.growthProgress = data.growthProgress
    }

    func getBuildingData() -> BuildingData {
        return BuildingData(playerIndex: player, buildingId: id, mapPoint: mapPoint, inventory: inventory.getInventoryData(), growthProgress: growthProgress)
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
