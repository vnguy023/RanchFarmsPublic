import SpriteKit

class Building: GameObject {
    private var mType = BuildingType.Unknown
    var type: BuildingType {
        get {return mType}
        set {
            mType = newValue

            self.texture = TextureManager.shared.getTexture(buildingType: newValue)
        }
    }

    var teleport: Teleport?

    init(buildingType: BuildingType, position: CGPoint, location: Location) {
        super.init(position: position, location: location)
        self.type = buildingType

        self.zPosition = 100
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
