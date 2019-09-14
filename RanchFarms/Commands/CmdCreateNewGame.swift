class CmdCreateNewGame: Command {
    // Input

    // Output
    var daysElapsed = 0
    private var buildings = [BuildingData]()
    private var terrains = [TerrainData]()
    private var player: PersonData!

    var worldData: WorldData!

    init() {
    }

    func execute() {
        createWorldSettings()
        createPlayer()
        createPlayerHouseItems()

        addTemporaryData()

        worldData = WorldData(daysElapsed: daysElapsed,
                              player: player,
                              buildings: buildings,
                              terrains: terrains)
    }

    private func createWorldSettings() {
        daysElapsed = 0
    }

    private func createPlayer() {
        var playerItems = [Int:ItemData]()
        playerItems[0] = ItemData(itemId: .Hoe, quantity: 1)
        playerItems[1] = ItemData(itemId: .WaterCan, quantity: 1)
        playerItems[2] = ItemData(itemId: .Axe, quantity: 1)
        playerItems[3] = ItemData(itemId: .PickAxe, quantity: 1)

        playerItems[8] = ItemData(itemId: .GarlicSeed, quantity: 9)
        playerItems[9] = ItemData(itemId: .Garlic, quantity: 5)
        playerItems[28] = ItemData(itemId: .Garlic, quantity: 990)
        playerItems[29] = ItemData(itemId: .Garlic, quantity: 5)

        player = PersonData(personId: .Player, money: 200, inventory: InventoryData(items: playerItems ))
    }

    private func createPlayerHouseItems() {
        let chair = BuildingData(playerIndex: .PlayerOne,
                     buildingId: .Chair,
                     mapPoint: MapPoint(x: 2, y: 6, location: .House))
        buildings.append(chair)

        let table = BuildingData(playerIndex: .PlayerOne,
                                 buildingId: .Table,
                                 mapPoint: MapPoint(x: 3, y: 5, location: .House))
        buildings.append(table)

        let tv = BuildingData(playerIndex: .PlayerOne,
                                 buildingId: .TV,
                                 mapPoint: MapPoint(x: 0, y: 5, location: .House))
        buildings.append(tv)
    }

    private func addTemporaryData() {
        let garlic = BuildingData(playerIndex: .PlayerOne,
                              buildingId: .Garlic,
                              mapPoint: MapPoint(x: 3, y: 2, location: .Farm),
                              inventory: InventoryData(),
                              growthProgress: 8)
        buildings.append(garlic)
    }
}
