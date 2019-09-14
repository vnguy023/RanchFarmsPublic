class PersonData: Codable {
    let personId: PersonId
    let money: Int

    let inventory: InventoryData

    init(personId: PersonId, money: Int, inventory: InventoryData) {
        self.personId = personId
        self.money = money
        self.inventory = inventory
    }
}
