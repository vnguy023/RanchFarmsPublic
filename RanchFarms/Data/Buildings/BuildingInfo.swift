class BuildingInfo {
    let id: BuildingId

    let buildingType: BuildingType
    let name: String

    init(buildingId: BuildingId, buildingType: BuildingType, name: String) {
        self.id = buildingId
        self.buildingType = buildingType
        self.name = name
    }
}
