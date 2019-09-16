import SpriteKit

class BuildingInfo {
    let id: BuildingId

    let buildingType: BuildingType
    let name: String
    let harvestDate: Int
    let harvestItemId: ItemId?
    let objSize: CGSize

    let teleportId: TeleportId?

    private init(buildingId: BuildingId, buildingType: BuildingType, objSize: CGSize, name: String, harvestDate: Int, harvestItemId: ItemId?, teleportId: TeleportId?) {
        self.id = buildingId
        self.buildingType = buildingType
        self.objSize = objSize
        self.name = name
        
        self.harvestDate = harvestDate
        self.harvestItemId = harvestItemId

        self.teleportId = teleportId
    }

    convenience init(buildingId: BuildingId, buildingType: BuildingType, objSize: CGSize, name: String) {
        self.init(buildingId: buildingId, buildingType: buildingType, objSize: objSize, name: name, harvestDate: 0, harvestItemId: nil, teleportId: nil)
    }

    convenience init(buildingId: BuildingId, buildingType: BuildingType, objSize: CGSize, name: String, harvestDate: Int, harvestItemId: ItemId) {
        self.init(buildingId: buildingId, buildingType: buildingType, objSize: objSize, name: name, harvestDate: harvestDate, harvestItemId: harvestItemId, teleportId: nil)
    }

    convenience init(buildingId: BuildingId, buildingType: BuildingType, objSize: CGSize, name: String, teleportId: TeleportId) {
        self.init(buildingId: buildingId, buildingType: buildingType, objSize: objSize, name: name, harvestDate: 0, harvestItemId: nil, teleportId: teleportId)
    }

}
