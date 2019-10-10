import SpriteKit

class World: SKNode {
    let saveSlot: SaveSlot

    var gameAreas = [Location: GameArea]()

    var player: Person!
    var npcs = [Person]()

    var memoryBank: MemoryBank
    var money = Int(0)
    var daysElapsed = Int(0)

    var currentLocation: Location {
        get {
            if player != nil {
                return player.location
            }
            return .House
        }
    }

    var gameTicksElapsedToday = GameTick(0)

    var teleportStartDay = TeleportId.House_Bed

    // Items to sell
    var farmDeliveryBoxItems = [Item]()

    // Hud Data
    // This should be temporary data for now. Think about throwing this into global
    var hudInterfaceData = HudInterfaceDataGame()

    init(saveSlot: SaveSlot, worldData: WorldData) {
        self.saveSlot = saveSlot
        self.memoryBank = MemoryBank(data: worldData.memoryBank)
        super.init()

        loadWorldData(worldData: worldData)
    }

    private func loadWorldData(worldData: WorldData) {
        var gameAreasDataToLoad = worldData.gameAreas.map({return $0.value})

        gameAreasDataToLoad.append(GameData.BasicHouse())
        gameAreasDataToLoad.append(GameData.Farm())
        gameAreasDataToLoad.append(GameData.GeneralStore())
        gameAreasDataToLoad.append(GameData.JamesHouse())
        gameAreasDataToLoad.append(GameData.Town())
        gameAreasDataToLoad.append(GameData.SouthBeach())
        gameAreasDataToLoad.append(GameData.Dungeon_Entrance())

        for gameArea in gameAreasDataToLoad {
            if gameAreas[gameArea.location] == nil {
                let newGameArea = GameArea()
                newGameArea.location = gameArea.location
                gameAreas[gameArea.location] = newGameArea
            }

            for buildingData in gameArea.buildings {
                let building = Building(player: buildingData.playerIndex,
                                        buildingId: buildingData.buildingId,
                                        mapPoint: buildingData.mapPoint)
                building.growthProgress = buildingData.growthProgress
                building.inventory = Inventory(data: buildingData.inventory)

                add(building: building)
            }

            for terrainData in gameArea.terrains {
                let terrain = Terrain(player: terrainData.playerIndex,
                                      terrainType: terrainData.terrainType,
                                      mapPoint: terrainData.mapPoint)

                add(terrain: terrain)
            }

            for tileData in gameArea.tiles {
                let tile = Tile(tileId: tileData.tileId,
                                mapPoint: tileData.mapPoint)

                add(tile: tile)
            }
        }

        self.player = Person(data: worldData.player)
        self.npcs = worldData.npcs.map({return Person(data: $0)})

        self.money = worldData.money
        self.daysElapsed = worldData.daysElapsed

        self.teleportStartDay = worldData.teleportStartDay
    }

    // specific to only playerData
    func getWorldDataSave() -> WorldData {
        var filteredGameAreaDatas = [Location: GameAreaData]()
        gameAreas.forEach({ filteredGameAreaDatas[$0.key] = $0.value.getGameAreasFilter(player: .PlayerOne)})

        return WorldData(gameAreas: filteredGameAreaDatas,
                         player: self.player.getPersonData(),
                         npcs: self.npcs.map({return $0.getPersonData()}),
                         memoryBank: self.memoryBank.getMemoryBankData(),
                         daysElapsed: self.daysElapsed,
                         teleportStartDay: GameData.GetTeleportStartDay())
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
        case .Axeing: fallthrough
        case .Hoeing: fallthrough
        case .Mining: fallthrough
        case .Watering:
            if player.stateDurationElapsed == Config.animationHoeingGameTickDuration {
                // TODO: Move the logic to change the world animation/state here
                player.state = .Idle
                player.stateDurationElapsed = 0
            }
        }

        postUpdate()
    }

    private func postUpdate() {
        // Animation/SFX Stuff
        var gameObjects = [GameObject]()
        gameObjects.append(player)
        if let gameArea = gameAreas[currentLocation] {
            gameArea.buildings.forEach({gameObjects.append($0)})
            gameArea.terrains.forEach({gameObjects.append($0)})
            gameArea.tiles.forEach({gameObjects.append($0)})
        }
        gameObjects.forEach ({
            $0.stateDurationElapsed += 1
            $0.sfxDurationElapsed += 1
        })

        player.previousLocation = player.location
        player.previousPosition = player.position
        gameTicksElapsedToday += 1
    }

    func getCurrentGameArea() -> GameArea {
        return gameAreas.filter({$0.key == currentLocation}).first!.value
    }

    func getTileAt(position: CGPoint, location: Location) -> Tile? {
        if let gameArea = gameAreas[location] {
            if let chosenTile = gameArea.tiles.filter({$0.contains(position)}).first {
                return chosenTile
            }
        }

        return nil
    }

    func getTerrainAt(position: CGPoint, location: Location) -> Terrain? {
        if let gameArea = gameAreas[location] {
            if let chosenTerrain = gameArea.terrains.filter({$0.contains(position)}).first {
                return chosenTerrain
            }
        }

        return nil
    }

    func getBuildingsAt(position: CGPoint, location: Location) -> [Building] {
        if let gameArea = gameAreas[location] {
            return gameArea.buildings.filter({$0.contains(position)})
        }
        return [Building]()
    }

    func teleport(to teleportId: TeleportId) {
        if let teleport = TeleportManager.shared.getTeleport(teleportId: teleportId) {
            player.teleport(to: teleport)
            reloadGameObjects()
        } else {
            print("[Desc=World.Teleport()] [Error=Unable to Teleport, Data doesn't exist]")
        }
    }

    func reloadGameObjects() {
        self.removeAllChildren()

        self.addChild(player)

        if let gameArea = gameAreas[currentLocation] {
            gameArea.buildings.forEach({self.addChild($0)})
            gameArea.tiles.forEach({self.addChild($0)})
            gameArea.terrains.forEach({self.addChild($0)})

            let cmdSetSpriteIndices = CmdSetSpriteIndices(gameArea: gameArea)
            cmdSetSpriteIndices.execute()

            gameArea.buildings.forEach({$0.updateTexture()})
            gameArea.terrains.forEach({$0.updateTexture()})
            gameArea.tiles.forEach({$0.updateTexture()})
        }

        // Animation/sfx stuff
        var gameObjects = [GameObject]()
        gameObjects.append(player)
        if let gameArea = gameAreas[currentLocation] {
            gameArea.buildings.forEach({gameObjects.append($0)})
            gameArea.terrains.forEach({gameObjects.append($0)})
            gameArea.tiles.forEach({gameObjects.append($0)})
        }
        gameObjects.forEach ({
            $0.stateDurationElapsed = 0
            $0.sfxApplied = nil
        })
    }

    func add(building: Building) {
        if let gameArea = gameAreas[building.location] {
            gameArea.buildings.append(building)
            if currentLocation == building.location {
                self.addChild(building)
            }
        }
    }

    func delete(building: Building) {
        if let gameArea = gameAreas[building.location] {
            gameArea.buildings = gameArea.buildings.filter({$0 !== building})
            if building.parent != nil {
                building.removeFromParent()
            }
        }
    }

    func add(terrain: Terrain) {
        if let gameArea = gameAreas[terrain.location] {
            gameArea.terrains.append(terrain)
            if currentLocation == terrain.location {
                self.addChild(terrain)
            }
        }
    }

    func delete(terrain: Terrain) {
        if let gameArea = gameAreas[terrain.location] {
            gameArea.terrains = gameArea.terrains.filter({$0 !== terrain})
            if terrain.parent != nil {
                terrain.removeFromParent()
            }
        }
    }

    func add(tile: Tile) {
        if let gameArea = gameAreas[tile.location] {
            gameArea.tiles.append(tile)
            if currentLocation == tile.location {
                self.addChild(tile)
            }
        }
    }

    func getCurrentSeason() -> Season {
        return Season(rawValue: UInt(daysElapsed / 28 % 4))!
    }

    func getCurrentDay() -> Int {
        return daysElapsed%Config.GameDaysPerMonth + 1
    }

    func getCurrentWeekDay() -> DayId {
        return DayId.getDayId(UInt(daysElapsed))
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
