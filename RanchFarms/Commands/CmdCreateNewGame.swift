class CmdCreateNewGame: Command {
    // Input

    // Output
    private var gameAreas = [Location: GameAreaData]()
    private var player: PersonData!
    private var npcs = [PersonData]()

    private var daysElapsed = 0

    var worldData: WorldData!

    init() {
    }

    func execute() {
        createWorldSettings()
        createPlayer()
        createPlayerHouse()
        createNpcs()

        worldData = WorldData(gameAreas: gameAreas,
                              player: player,
                              npcs: npcs,
                              daysElapsed: daysElapsed,
                              teleportStartDay: TeleportId.House_Bed)
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

    private func createPlayerHouse() {
        let location = Location.House

        var buildings = [BuildingData]()
        let terrains = [TerrainData]()
        let tiles = [TileData]()

        let chair = BuildingData(playerIndex: .PlayerOne,
                     buildingId: .Chair,
                     mapPoint: MapPoint(x: 2, y: 6, location: location))
        buildings.append(chair)

        let table = BuildingData(playerIndex: .PlayerOne,
                                 buildingId: .Table,
                                 mapPoint: MapPoint(x: 3, y: 5, location: location))
        buildings.append(table)

        let tv = BuildingData(playerIndex: .PlayerOne,
                                 buildingId: .TV,
                                 mapPoint: MapPoint(x: 0, y: 5, location: location))
        buildings.append(tv)

        gameAreas[location] = GameAreaData(location: location, buildings: buildings, terrains: terrains, tiles: tiles)
    }

    private func createNpcs() {
        npcs.append(PersonData(personId: .Lily, money: 0, inventory: InventoryData()))
        npcs.append(PersonData(personId: .James, money: 0, inventory: InventoryData()))
    }
}
