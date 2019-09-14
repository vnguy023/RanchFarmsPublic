import SpriteKit

class World: SKNode {
    let saveSlot: SaveSlot

    var player: Person!

    var gameAreas = [GameArea]()
    var npcs = [GameObject]()

    var currentLocation: Location {
        get {return player.location}
    }

    var daysElapsed = Int(0)

    var gameTicksElapsedToday = GameTick(0)

    let teleportStartDay = Teleport(mapPoint: MapPoint(x: 7, y: 1, location: .House),
                                    directionToFace: .SOUTH)
    // Items to sell
    var farmDeliveryBoxItems = [Item]()

    // Hud Data
    // This should be temporary data for now. Think about throwing this into global
    var hudInterfaceData = HudInterfaceData()

    override init() {
        saveSlot = SaveSlot.Slot1
        super.init()
    }

    init(saveSlot: SaveSlot) {
        self.saveSlot = saveSlot
        super.init()

        // how to differentiate from saving/loading -- we may not care
        let cmdCreateNewGame = CmdCreateNewGame()
        cmdCreateNewGame.execute()

        loadWorldData(worldData: cmdCreateNewGame.worldData)

        // temporary until we migrate this stuff somewhere else
        gameAreas.append(sampleHouse())
        gameAreas.append(sampleFarm())
        gameAreas.append(sampleTown())
    }

    func loadWorldData(worldData: WorldData) {
        self.daysElapsed = worldData.daysElapsed
        self.player = Person(data: worldData.player)
    }

    private func getBuildingsData() -> [BuildingData] {
        var buildingsData = [BuildingData]()

        for gameArea in gameAreas {
            for building in gameArea.buildings.filter({$0.player == .PlayerOne}) {
                buildingsData.append(building.getBuildingData())
            }
        }

        return buildingsData
    }

    private func getTerrainsData() -> [TerrainData] {
        var terrainsData = [TerrainData]()

        for gameArea in gameAreas {
            for terrain in gameArea.terrains.filter({$0.player == .PlayerOne}) {
                terrainsData.append(terrain.getTerrainData())
            }
        }

        return terrainsData
    }

    func getWorldData() -> WorldData {
        return WorldData(daysElapsed: self.daysElapsed, player: player.getPersonData(), buildings: getBuildingsData(), terrains: getTerrainsData())
    }

    // advances world by one gameTick
    func update() {
        switch player.state {
        case .Idle: break
        case .Walking:
            if player.position == player.previousPosition {
                player.state = .Idle
                player.stateDurationElapsed = 0
            }
        }

        postUpdate()
    }

    private func postUpdate() {
        player.stateDurationElapsed += 1
        player.previousLocation = player.location
        player.previousPosition = player.position
        gameTicksElapsedToday += 1
    }

    func getCurrentGameArea() -> GameArea {
        return gameAreas.filter({$0.location == currentLocation}).first!
    }

    func getTerrainAt(position: CGPoint, location: Location) -> Terrain? {
        if let gameArea = gameAreas.filter({$0.location == location}).first {
            if let chosenTerrain = gameArea.terrains.filter({$0.contains(position)}).first {
                return chosenTerrain
            }
        }

        return nil
    }

    func getTileAt(position: CGPoint, location: Location) -> Tile? {
        if let gameArea = gameAreas.filter({$0.location == location}).first {
            if let chosenTile = gameArea.tiles.filter({$0.contains(position)}).first {
                return chosenTile
            }
        }

        return nil
    }

    func getBuildingsAt(position: CGPoint, location: Location) -> [Building] {
        if let gameArea = gameAreas.filter({$0.location == location}).first {
            return gameArea.buildings.filter({$0.contains(position)})
        }
        return [Building]()
    }

    func teleport(to teleport: Teleport) {
        player.mapPoint = teleport.mapPoint
        player.faceDirection = teleport.directionToFace

        reloadGameObjects()
    }

    func reloadGameObjects() {
        self.removeAllChildren()

        self.addChild(player)

        for gameArea in gameAreas.filter({$0.location == currentLocation}) {
            gameArea.buildings.forEach({self.addChild($0)})
            gameArea.tiles.forEach({self.addChild($0)})
            gameArea.terrains.forEach({self.addChild($0)})
        }
    }

    private func sampleHouse() -> GameArea {
        let location = Location.House

        let gameArea = GameArea()
        gameArea.location = location

        //Buildings
        let door = Building(player: .Game,
                            buildingId: .Door,
                            mapPoint: MapPoint(x: 1, y: -2, location: location))
        door.teleport = Teleport(mapPoint: MapPoint(x: 3, y: 5, location: .Farm),
                                 directionToFace: .SOUTH)
        gameArea.buildings.append(door)

        let bed = Building(player: .Game,
                           buildingId: .SingleBed,
                           mapPoint: MapPoint(x: 8, y: 0, location: location))
        gameArea.buildings.append(bed)

        let chair = Building(player: .PlayerOne,
                             buildingId: .Chair,
                             mapPoint: MapPoint(x: 2, y: 6, location: location))
        gameArea.buildings.append(chair)

        let table = Building(player: .PlayerOne,
                             buildingId: .Table,
                             mapPoint: MapPoint(x: 3, y: 5, location: location))
        gameArea.buildings.append(table)

        let tv = Building(player: .PlayerOne,
                          buildingId: .TV,
                          mapPoint: MapPoint(x: 0, y: 5, location: location))
        gameArea.buildings.append(tv)

        // Tiles/Terrains
        for x in 0...9 {
            for y in 0...6 {
                let tile = Tile(tileType: TileType.Dirt,
                                mapPoint: MapPoint(x: x, y: y, location: location))
                gameArea.tiles.append(tile)

                let terrain = Terrain(player: PlayerIndex.Game,
                                      terrainType: TerrainType.Wood,
                                      mapPoint: MapPoint(x: x, y: y, location: location))
                gameArea.terrains.append(terrain)
            }
        }

        return gameArea
    }

    private func sampleFarm() -> GameArea {
        let location = Location.Farm

        let gameArea = GameArea()
        gameArea.location = location

        //Buildings
        let houseDoor = Building(player: .Game,
                                 buildingId: .Door,
                                 mapPoint: MapPoint(x: 3, y: 6, location: location))
        houseDoor.teleport = Teleport(mapPoint: MapPoint(x: 1, y: 0, location: .House),
                                     directionToFace: .NORTH)
        gameArea.buildings.append(houseDoor)

        let townDoor = Building(player: .Game,
                                buildingId: .Door,
                                mapPoint: MapPoint(x: 6, y: 3, location: location))
        townDoor.teleport = Teleport(mapPoint: MapPoint(x: 0, y: 0, location: .Town),
                                     directionToFace: .EAST)
        gameArea.buildings.append(townDoor)

        let farmDeliveryBox = Building(player: .Game,
                                       buildingId: .FarmDeliveryBox,
                                       mapPoint: MapPoint(x: 5, y: 6, location: location))
        gameArea.buildings.append(farmDeliveryBox)

        let sign = Building(player: .Game,
                            buildingId: .PlayerHouseSign,
                            mapPoint: MapPoint(x: 4, y: 6, location: location))
        gameArea.buildings.append(sign)

        let vendingMachine = Building(player: .Game,
                                      buildingId: .VendingMachine,
                                      mapPoint: MapPoint(x: 1, y: 6, location: location))
        gameArea.buildings.append(vendingMachine)

        let garlic = Building(player: .PlayerOne,
                              buildingId: .Garlic,
                              mapPoint: MapPoint(x: 3, y: 2, location: location))
        garlic.growthProgress = 8
        gameArea.buildings.append(garlic)

        // Tiles
        for x in -5...5 {
            for y in -5...5 {
                var tileType = TileType.Dirt
                if x%2 == 0 {
                    tileType = .Grass
                }

                let tile = Tile.init(tileType: tileType,
                                     mapPoint: MapPoint(x: x, y: y, location: location))
                gameArea.tiles.append(tile)
            }
        }

        return gameArea
    }

    private func sampleTown() -> GameArea {
        let location = Location.Town

        let gameArea = GameArea()
        gameArea.location = location

        //Buildings
        let door = Building(player: .Game,
                            buildingId: .Door,
                            mapPoint: MapPoint(x: -1, y: 0, location: location))
        door.teleport = Teleport(mapPoint: MapPoint(x: 5, y: 3, location: .Farm),
                                 directionToFace: .WEST)
        gameArea.buildings.append(door)

        // Tiles
        for x in 0...10 {
            for y in -5...5 {
                let tileType = TileType.Water

                let tile = Tile.init(tileType: tileType,
                                     mapPoint: MapPoint(x: x, y: y, location: location))
                gameArea.tiles.append(tile)
            }
        }

        return gameArea
    }

    func delete(building: Building) {
        if let gameArea = gameAreas.filter({$0.location == building.location}).first {
            gameArea.buildings = gameArea.buildings.filter({$0 !== building})
            if building.parent != nil {
                building.removeFromParent()
            }
        }
    }

    func delete(terrain: Terrain) {
        if let gameArea = gameAreas.filter({$0.location == terrain.location}).first {
            gameArea.terrains = gameArea.terrains.filter({$0 !== terrain})
            if terrain.parent != nil {
                terrain.removeFromParent()
            }
        }
    }

    func getCurrentSeason() -> Season {
        return Season(rawValue: UInt(daysElapsed / 28 % 4))!
    }

    func getCurrentDay() -> Int {
        return daysElapsed%Config.GameDaysPerMonth + 1
    }

    func getCurrentWeekDay() -> Int {
        return daysElapsed % 7
    }

    func getCurrentHour() -> Int {
        return Int(gameTicksElapsedToday/Config.GameTicksPerGameMinute/60)
    }

    func getCurrentMinutes() -> Int {
        return Int(gameTicksElapsedToday/Config.GameTicksPerGameMinute) % 60
    }

    func getCurrentMeridian() -> String {
        return "AM"
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
