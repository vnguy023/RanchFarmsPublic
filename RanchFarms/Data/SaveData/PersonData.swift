class PersonData: Codable {
    let id: PersonId
    let money: Int

    let inventory: [ItemData?]

    init(personId: PersonId, money: Int, inventory: [ItemData?]) {
        self.id = personId
        self.money = money
        self.inventory = inventory
    }
}
