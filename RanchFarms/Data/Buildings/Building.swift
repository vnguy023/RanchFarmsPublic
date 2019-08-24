import SpriteKit

class Building: GameObject {
    let buildingId: BuildingId

    let buildingInfo: BuildingInfo!

    var teleport: Teleport?

    init(buildingId: BuildingId, position: CGPoint, location: Location) {
        self.buildingId = buildingId
        self.buildingInfo = BuildingInfoManager.shared.getBuildingInfo(buildingId: buildingId)

        super.init(position: position, location: location)

        self.texture = TextureManager.shared.getTexture(buildingId: buildingId)
        self.zPosition = 100
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
