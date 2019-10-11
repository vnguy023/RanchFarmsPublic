class PersonData: Codable {
    let personId: PersonId
    let mapPoint: MapPoint
    let money: Int

    let inventory: InventoryData

    init(personId: PersonId, mapPoint: MapPoint, money: Int, inventory: InventoryData) {
        self.personId = personId
        self.mapPoint = mapPoint
        self.money = money
        self.inventory = inventory
    }
}
