class PersonData: Codable {
    let id: PersonId
    let money: Int

    let inventory: InventoryData

    init(personId: PersonId, money: Int, inventory: InventoryData) {
        self.id = personId
        self.money = money
        self.inventory = inventory
    }
}
