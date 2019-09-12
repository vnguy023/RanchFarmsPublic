class CmdCreateNewGame: Command {
    // Input

    // Output
    var daysElapsed = 0
    var buildings = [Building]()
    let player = Person(personId: .Player, mapPoint: MapPoint(x: 0, y: 0, location: .House)) // Doesn't matter where player starts

    init() {
    }

    func execute() {
        createWorldSettings()
        createPlayer()
    }

    private func createWorldSettings() {
        daysElapsed = 0
    }

    private func createPlayer() {
        player.inventory.items[0] = Item(itemId: .Hoe, quantity: 1)
        player.inventory.items[1] = Item(itemId: .WaterCan, quantity: 1)
        player.inventory.items[2] = Item(itemId: .Axe, quantity: 1)
        player.inventory.items[3] = Item(itemId: .PickAxe, quantity: 1)

        player.inventory.items[8] = Item(itemId: .GarlicSeed, quantity: 9)
        player.inventory.items[9] = Item(itemId: .Garlic, quantity: 5)
        player.inventory.items[28] = Item(itemId: .Garlic, quantity: 990)
        player.inventory.items[29] = Item(itemId: .Garlic, quantity: 5)
    }

    private func createPlayerHouseItems() {
        let chair = Building(player: .PlayerOne,
                             buildingId: .Chair,
                             mapPoint: MapPoint(x: 2, y: 6, location: .House))
        buildings.append(chair)

        let table = Building(player: .PlayerOne,
                             buildingId: .Table,
                             mapPoint: MapPoint(x: 3, y: 5, location: .House))
        buildings.append(table)

        let tv = Building(player: .PlayerOne,
                          buildingId: .TV,
                          mapPoint: MapPoint(x: 0, y: 5, location: .House))
        buildings.append(tv)
    }
}
