class BuildingInfo {
    let id: BuildingId

    let buildingType: BuildingType
    let name: String
    let growthTextureMap: [Int: String]?

    init(buildingId: BuildingId, buildingType: BuildingType, name: String, growthTextureMap: [Int: String]?) {
        self.id = buildingId
        self.buildingType = buildingType
        self.name = name
        self.growthTextureMap = growthTextureMap
    }

    convenience init(buildingId: BuildingId, buildingType: BuildingType, name: String) {
        self.init(buildingId: buildingId, buildingType: buildingType, name: name, growthTextureMap: nil)
    }
}
