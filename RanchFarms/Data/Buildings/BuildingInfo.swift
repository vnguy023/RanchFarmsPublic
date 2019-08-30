class BuildingInfo {
    let id: BuildingId

    let buildingType: BuildingType
    let name: String
    let growthTextureMap: [Int: String]?
    let harvestDate: Int? // amke it the greatest int in growthTextureMap

    init(buildingId: BuildingId, buildingType: BuildingType, name: String, growthTextureMap: [Int: String]?) {
        self.id = buildingId
        self.buildingType = buildingType
        self.name = name
        self.growthTextureMap = growthTextureMap

        if growthTextureMap != nil {
            var maxDay = 0
            for iter in growthTextureMap! {
                if iter.key > maxDay {
                    maxDay = iter.key
                }
            }
            self.harvestDate = maxDay
        } else {
            self.harvestDate = nil
        }
    }

    convenience init(buildingId: BuildingId, buildingType: BuildingType, name: String) {
        self.init(buildingId: buildingId, buildingType: buildingType, name: name, growthTextureMap: nil)
    }
}
