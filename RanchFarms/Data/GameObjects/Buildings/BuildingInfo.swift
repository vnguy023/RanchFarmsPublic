import SpriteKit

class BuildingInfo {
    let id: BuildingId

    let buildingType: BuildingType
    let name: String
    let harvestDate: Int!
    let harvestItemId: ItemId?
    let objSize: CGSize
    let isBlocking: Bool
    let hasSpriteIndices: Bool

    init(buildingId: BuildingId, buildingType: BuildingType,
         objSize: CGSize, isBlocking: Bool,
         hasSpriteIndices: Bool,
         name: String,
         harvestDate: Int?, harvestItemId: ItemId?) {
        self.id = buildingId
        self.buildingType = buildingType
        self.objSize = objSize
        self.isBlocking = isBlocking
        self.hasSpriteIndices = hasSpriteIndices
        self.name = name
        
        self.harvestDate = harvestDate
        self.harvestItemId = harvestItemId
    }
}
