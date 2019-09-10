import SpriteKit

class BuildingInfo {
    let id: BuildingId

    let buildingType: BuildingType
    let name: String
    let harvestDate: Int
    let harvestItemId: ItemId?
    let objSize: CGSize

    init(buildingId: BuildingId, buildingType: BuildingType, objSize: CGSize, name: String, harvestDate: Int, harvestItemId: ItemId?) {
        self.id = buildingId
        self.buildingType = buildingType
        self.objSize = objSize
        self.name = name
        
        self.harvestDate = harvestDate
        self.harvestItemId = harvestItemId
    }

    convenience init(buildingId: BuildingId, buildingType: BuildingType, objSize: CGSize, name: String) {
        self.init(buildingId: buildingId, buildingType: buildingType, objSize: objSize, name: name, harvestDate: 0, harvestItemId: nil)
    }
}
