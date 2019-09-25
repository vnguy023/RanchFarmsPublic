import SpriteKit

class BuildingInfo {
    let id: BuildingId

    let buildingType: BuildingType
    let name: String
    let harvestDate: Int
    let harvestItemId: ItemId?
    let objSize: CGSize
    let isBlocking: Bool

    let gameEventId: GameEventId?

    init(buildingId: BuildingId, buildingType: BuildingType, objSize: CGSize, isBlocking: Bool, name: String, harvestDate: Int, harvestItemId: ItemId?, gameEventId: GameEventId?) {
        self.id = buildingId
        self.buildingType = buildingType
        self.objSize = objSize
        self.isBlocking = isBlocking
        self.name = name
        
        self.harvestDate = harvestDate
        self.harvestItemId = harvestItemId

        self.gameEventId = gameEventId
    }

    convenience init(buildingId: BuildingId, buildingType: BuildingType, objSize: CGSize, isBlocking: Bool, name: String) {
        self.init(buildingId: buildingId, buildingType: buildingType, objSize: objSize, isBlocking: isBlocking, name: name, harvestDate: 0, harvestItemId: nil, gameEventId: nil)
    }

    convenience init(buildingId: BuildingId, buildingType: BuildingType, objSize: CGSize, isBlocking: Bool, name: String, harvestDate: Int, harvestItemId: ItemId) {
        self.init(buildingId: buildingId, buildingType: buildingType, objSize: objSize, isBlocking: isBlocking, name: name, harvestDate: harvestDate, harvestItemId: harvestItemId, gameEventId: nil)
    }

    convenience init(buildingId: BuildingId, buildingType: BuildingType, objSize: CGSize, isBlocking: Bool, name: String, teleportId: TeleportId) {
        self.init(buildingId: buildingId, buildingType: buildingType, objSize: objSize, isBlocking: isBlocking, name: name, harvestDate: 0, harvestItemId: nil, gameEventId: nil)
    }

    convenience init(buildingId: BuildingId, buildingType: BuildingType, objSize: CGSize, isBlocking: Bool, name: String, gameEventId: GameEventId) {
        self.init(buildingId: buildingId, buildingType: buildingType, objSize: objSize, isBlocking: isBlocking, name: name, harvestDate: 0, harvestItemId: nil, gameEventId: gameEventId)
    }

}
