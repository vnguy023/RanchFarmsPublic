import SpriteKit

class BuildingInfo {
    let id: BuildingId

    let buildingType: BuildingType
    let name: String
    let harvestDate: Int
    let harvestItemId: ItemId?
    let objSize: CGSize
    let isBlocking: Bool

    init(buildingId: BuildingId, buildingType: BuildingType, objSize: CGSize, isBlocking: Bool, name: String, harvestDate: Int, harvestItemId: ItemId?) {
        self.id = buildingId
        self.buildingType = buildingType
        self.objSize = objSize
        self.isBlocking = isBlocking
        self.name = name
        
        self.harvestDate = harvestDate
        self.harvestItemId = harvestItemId
    }

    // Standard building
    convenience init(buildingId: BuildingId, buildingType: BuildingType, objSize: CGSize, isBlocking: Bool, name: String) {
        self.init(buildingId: buildingId, buildingType: buildingType, objSize: objSize, isBlocking: isBlocking, name: name, harvestDate: 0, harvestItemId: nil)
    }

    // Crops
    /* -- for now this is the same as default initializor
    convenience init(buildingId: BuildingId, buildingType: BuildingType, objSize: CGSize, isBlocking: Bool, name: String, harvestDate: Int, harvestItemId: ItemId) {
        self.init(buildingId: buildingId, buildingType: buildingType, objSize: objSize, isBlocking: isBlocking, name: name, harvestDate: harvestDate, harvestItemId: harvestItemId)
    }
     */
}
