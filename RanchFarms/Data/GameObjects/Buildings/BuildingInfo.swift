import SpriteKit

class BuildingInfo {
    let id: BuildingId

    let buildingType: BuildingType
    let name: String
    let growthTextureMap: [Int: String]?
    let harvestDate: Int? // amke it the greatest int in growthTextureMap
    let harvestItemId: ItemId?
    let objSize: CGSize

    init(buildingId: BuildingId, buildingType: BuildingType, objSize: CGSize, name: String, growthTextureMap: [Int: String]?, harvestItemId: ItemId?) {
        self.id = buildingId
        self.buildingType = buildingType
        self.objSize = objSize
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
        self.harvestItemId = harvestItemId
    }

    convenience init(buildingId: BuildingId, buildingType: BuildingType, objSize: CGSize, name: String) {
        self.init(buildingId: buildingId, buildingType: buildingType, objSize: objSize, name: name, growthTextureMap: nil, harvestItemId: nil)
    }
}
