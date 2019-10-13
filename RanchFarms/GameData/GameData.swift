class GameData {

    static func GetTeleportStartDay() -> TeleportId {
        return .House_Bed
    }

    static func BasicHouse() -> GameAreaData {
        let location = Location.House

        var buildings = [MapPoint: BuildingData]()
        var terrains = [MapPoint: TerrainData]()
        var tiles = [MapPoint: TileData]()
        let people = [PersonData]()

        // MainRoom
        for x in 0...9 {
            for y in 0...6 {
                let tile = TileData(tileId: .Dirt,
                                    mapPoint: MapPoint(x: x, y: y, location: location))
                tiles[tile.mapPoint] = tile
            }
        }

        // FrontDoor <-> MainRoom
        for x in 1...1 {
            for y in (-2)...(-1) {
                let tile = TileData(tileId: .Dirt,
                                    mapPoint: MapPoint(x: x, y: y, location: location))
                tiles[tile.mapPoint] = tile
            }
        }

        // replace floor with wood
        for tile in tiles {
            terrains[tile.key] = TerrainData(playerIndex: .Game,
                                                  terrainType: .Wood,
                                                  mapPoint: tile.key)
        }

        for wall in GenerateWalls(tiles: tiles, wallType: .Wall) {
            buildings[wall.mapPoint] = wall
        }

        // Buildings
        let bed = BuildingData(playerIndex: .Game,
                               buildingId: .SingleBed,
                               mapPoint: MapPoint(x: 8, y: 0, location: location))
        buildings[bed.mapPoint] = bed

        return GameAreaData(location: location,
                            buildings: buildings.compactMap({return $0.value}),
                            terrains: terrains.compactMap({return $0.value}),
                            tiles: tiles.compactMap({return $0.value}),
                            people: people)
    }

    static func Farm() -> GameAreaData {
        let location = Location.Farm

        var buildings = [MapPoint: BuildingData]()
        let terrains = [MapPoint: TerrainData]()
        var tiles = [MapPoint: TileData]()
        let people = [PersonData]()

        // Buildings
        let farmHouse = BuildingData(playerIndex: .Game,
                                     buildingId: .FarmHouse,
                                     mapPoint: MapPoint(x: 1, y: 7, location: location))
        buildings[farmHouse.mapPoint] = farmHouse

        let houseDoor = BuildingData(playerIndex: .Game,
                                     buildingId: .FarmToHouseDoor,
                                     mapPoint: MapPoint(x: 3, y: 7, location: location))
        buildings[houseDoor.mapPoint] = houseDoor

        let townDoor = BuildingData(playerIndex: .Game,
                                    buildingId: .FarmToTownDoor,
                                    mapPoint: MapPoint(x: 6, y: 3, location: location))
        buildings[townDoor.mapPoint] = townDoor

        let farmDeliveryBox = BuildingData(playerIndex: .Game,
                                           buildingId: .FarmDeliveryBox,
                                           mapPoint: MapPoint(x: 5, y: 6, location: location))
        buildings[farmDeliveryBox.mapPoint] = farmDeliveryBox

        let sign = BuildingData(playerIndex: .Game,
                                buildingId: .PlayerHouseSign,
                                mapPoint: MapPoint(x: 4, y: 6, location: location))
        buildings[sign.mapPoint] = sign

        // Tiles/Terrains
        for x in -5...5 {
            for y in -5...6 {
                let tile = TileData(tileId: TileId.Dirt,
                                    mapPoint: MapPoint(x: x, y: y, location: location))
                tiles[tile.mapPoint] = tile
            }
        }

        return GameAreaData(location: location,
                            buildings: buildings.compactMap({return $0.value}),
                            terrains: terrains.compactMap({return $0.value}),
                            tiles: tiles.compactMap({return $0.value}),
                            people: people)
    }

    static func SouthBeach() -> GameAreaData {
        let location = Location.South_Beach

        let buildings = [MapPoint: BuildingData]()
        var terrains = [MapPoint: TerrainData]()
        var tiles = [MapPoint: TileData]()
        let people = [PersonData]()

        // Buildings

        // Tiles/Terrains
        for x in 0...15 {
            for y in (-4)...(0) {
                let tile = TileData(tileId: .Sand,
                                    mapPoint: MapPoint(x: x, y: y, location: location))
                tiles[tile.mapPoint] = tile
            }

            for y in (-10)...(-5) {
                let tile = TileData(tileId: .Water,
                                    mapPoint: MapPoint(x: x, y: y, location: location))
                tiles[tile.mapPoint] = tile
            }
        }

        // SouthBeach -> Town
        for x in 4...4 {
            for y in (1)...(2) {
                let tile = TileData(tileId: .Grass,
                                    mapPoint: MapPoint(x: x, y: y, location: location))
                tiles[tile.mapPoint] = tile
            }
        }

        // SouthBeach -> DungeonEntrance
        for x in 8...8 {
            for y in (1)...(2) {
                let tile = TileData(tileId: .Dirt,
                                    mapPoint: MapPoint(x: x, y: y, location: location))
                tiles[tile.mapPoint] = tile
            }
        }

        for x in 2...3 {
            for y in (-8)...(-4) {
                let terrain = TerrainData(playerIndex: .Game,
                                          terrainType: .Wood,
                                          mapPoint: MapPoint(x: x, y: y, location: location))
                terrains[terrain.mapPoint] = terrain
            }
        }

        return GameAreaData(location: location,
                            buildings: buildings.compactMap({return $0.value}),
                            terrains: terrains.compactMap({return $0.value}),
                            tiles: tiles.compactMap({return $0.value}),
                            people: people)
    }

    static func Town() -> GameAreaData {
        let location = Location.Town

        var buildings = [MapPoint: BuildingData]()
        var terrains = [MapPoint: TerrainData]()
        var tiles = [MapPoint: TileData]()
        let people = [PersonData]()

        // Buildings
        let farmDoor = BuildingData(playerIndex: .Game,
                                    buildingId: .TownToFarmDoor,
                                    mapPoint: MapPoint(x: -1, y: 0, location: location))
        buildings[farmDoor.mapPoint] = farmDoor

        let generalStoreDoor = BuildingData(playerIndex: .Game,
                                            buildingId: .TownToGeneralStoreDoor,
                                            mapPoint: MapPoint(x: 2, y: 6, location: location))
        buildings[generalStoreDoor.mapPoint] = generalStoreDoor


        let jamesHouse = BuildingData(playerIndex: .Game,
                                     buildingId: .JamesHouse,
                                     mapPoint: MapPoint(x: 6, y: 6, location: location))
        buildings[jamesHouse.mapPoint] = jamesHouse
        let jamesHouseDoor = BuildingData(playerIndex: .Game,
                                            buildingId: .TownToJamesHouseDoor,
                                            mapPoint: MapPoint(x: 8, y: 6, location: location))
        buildings[jamesHouseDoor.mapPoint] = jamesHouseDoor

        // Tiles/Terrains
        for x in 0...10 {
            for y in -5...5 {
                let tile = TileData(tileId: TileId.Grass,
                                    mapPoint: MapPoint(x: x, y: y, location: location))
                tiles[tile.mapPoint] = tile
            }
        }

        // path to GeneralStore
        for x in 2...3 {
            for y in 0...5 {
                let terrain = TerrainData(playerIndex: .Game, terrainType: TerrainType.StonePath,
                                          mapPoint: MapPoint(x: x, y: y, location: location))
                terrains[terrain.mapPoint] = terrain
            }
        }

        // path to JamesHouse
        for x in 8...9 {
            for y in 0...5 {
                let terrain = TerrainData(playerIndex: .Game, terrainType: TerrainType.StonePath,
                                          mapPoint: MapPoint(x: x, y: y, location: location))
                terrains[terrain.mapPoint] = terrain
            }
        }

        for x in 0...9 {
            for y in 0...1 {
                let terrain = TerrainData(playerIndex: .Game, terrainType: TerrainType.StonePath,
                                          mapPoint: MapPoint(x: x, y: y, location: location))
                terrains[terrain.mapPoint] = terrain
            }
        }

        for x in 4...5 {
            for y in -5...1 {
                let terrain = TerrainData(playerIndex: .Game, terrainType: TerrainType.StonePath,
                                          mapPoint: MapPoint(x: x, y: y, location: location))
                terrains[terrain.mapPoint] = terrain
            }
        }

        // Path to SouthBeach
        for x in 4...4 {
            for y in (-7)...(-6) {
                let tile = TileData(tileId: .Sand,
                                    mapPoint: MapPoint(x: x, y: y, location: location))
                tiles[tile.mapPoint] = tile
            }
        }

        return GameAreaData(location: location,
                            buildings: buildings.compactMap({return $0.value}),
                            terrains: terrains.compactMap({return $0.value}),
                            tiles: tiles.compactMap({return $0.value}),
                            people: people)
    }

    static func GeneralStore() -> GameAreaData {
        let location = Location.General_Store

        var buildings = [MapPoint: BuildingData]()
        var terrains = [MapPoint: TerrainData]()
        var tiles = [MapPoint: TileData]()
        let people = [PersonData]()

        // Main store area
        for x in 0...4 {
            for y in 0...4 {
                let tile = TileData(tileId: .Dirt,
                                    mapPoint: MapPoint(x: x, y: y, location: location))
                tiles[tile.mapPoint] = tile
            }
        }

        // Front door entrrance
        for x in 1...1 {
            for y in (-2)...(-1) {
                let tile = TileData(tileId: .Dirt,
                                    mapPoint: MapPoint(x: x, y: y, location: location))
                tiles[tile.mapPoint] = tile
            }
        }

        // Bedroom
        for x in -2...4 {
            for y in 10...15 {
                let tile = TileData(tileId: .Dirt,
                                    mapPoint: MapPoint(x: x, y: y, location: location))
                tiles[tile.mapPoint] = tile
            }
        }
        for y in 5...9 {// Bedroom <-> FrontDoor Hallway
            let tile = TileData(tileId: .Dirt,
                                mapPoint: MapPoint(x: 4, y: y, location: location))
            tiles[tile.mapPoint] = tile
        }

        // replace floor with wood
        for tile in tiles {
            terrains[tile.key] = TerrainData(playerIndex: .Game,
                                                  terrainType: .Wood,
                                                  mapPoint: tile.key)
        }

        for wall in GenerateWalls(tiles: tiles, wallType: .Wall) {
            buildings[wall.mapPoint] = wall
        }

        // Buildings
        let cashier = BuildingData(playerIndex: .Game,
                                      buildingId: .Cashier,
                                      mapPoint: MapPoint(x: 1, y: 3, location: location))
        buildings[cashier.mapPoint] = cashier

        let easel = BuildingData(playerIndex: .Game,
                                 buildingId: .Easel,
                                 mapPoint: MapPoint(x: 2, y: 15, location: location))
        buildings[easel.mapPoint] = easel

        let bookshelf1 = BuildingData(playerIndex: .Game,
                                      buildingId: .Bookshelf,
                                      mapPoint: MapPoint(x: 3, y: 15, location: location))
        buildings[bookshelf1.mapPoint] = bookshelf1

        let bookshelf2 = BuildingData(playerIndex: .Game,
                                      buildingId: .Bookshelf,
                                      mapPoint: MapPoint(x: 4, y: 15, location: location))
        buildings[bookshelf2.mapPoint] = bookshelf2

        return GameAreaData(location: location,
                            buildings: buildings.compactMap({return $0.value}),
                            terrains: terrains.compactMap({return $0.value}),
                            tiles: tiles.compactMap({return $0.value}),
                            people: people)
    }

    static func JamesHouse() -> GameAreaData {
        let location = Location.James_House

        var buildings = [MapPoint: BuildingData]()
        var terrains = [MapPoint: TerrainData]()
        var tiles = [MapPoint: TileData]()
        let people = [PersonData]()

        // Main store area
        for x in 0...4 {
            for y in 0...4 {
                let tile = TileData(tileId: .Dirt,
                                    mapPoint: MapPoint(x: x, y: y, location: location))
                tiles[tile.mapPoint] = tile
            }
        }

        // Front door entrrance
        for x in 1...1 {
            for y in (-2)...(-1) {
                let tile = TileData(tileId: .Dirt,
                                    mapPoint: MapPoint(x: x, y: y, location: location))
                tiles[tile.mapPoint] = tile
            }
        }

        // Bedroom
        for x in -2...4 {
            for y in 10...15 {
                let tile = TileData(tileId: .Dirt,
                                    mapPoint: MapPoint(x: x, y: y, location: location))
                tiles[tile.mapPoint] = tile
            }
        }
        for y in 5...9 {// Bedroom <-> FrontDoor Hallway
            let tile = TileData(tileId: .Dirt,
                                mapPoint: MapPoint(x: 4, y: y, location: location))
            tiles[tile.mapPoint] = tile
        }

        // replace floor with wood
        for tile in tiles {
            terrains[tile.key] = TerrainData(playerIndex: .Game,
                                                  terrainType: .Wood,
                                                  mapPoint: tile.key)
        }

        for wall in GenerateWalls(tiles: tiles, wallType: .Wall) {
            buildings[wall.mapPoint] = wall
        }

        // Buildings

        return GameAreaData(location: location,
                            buildings: buildings.compactMap({return $0.value}),
                            terrains: terrains.compactMap({return $0.value}),
                            tiles: tiles.compactMap({return $0.value}),
                            people: people)
    }

    static func Dungeon_Entrance() -> GameAreaData {
        let location = Location.Dungeon_Entrance

        var buildings = [MapPoint: BuildingData]()
        let terrains = [MapPoint: TerrainData]()
        var tiles = [MapPoint: TileData]()
        var people = [PersonData]()

        // Main area
        for x in 0...4 {
            for y in 0...4 {
                let tile = TileData(tileId: .Dirt,
                                    mapPoint: MapPoint(x: x, y: y, location: location))
                tiles[tile.mapPoint] = tile
            }
        }

        // Front door entrance
        for x in 1...1 {
            for y in (-2)...(-1) {
                let tile = TileData(tileId: .Dirt,
                                    mapPoint: MapPoint(x: x, y: y, location: location))
                tiles[tile.mapPoint] = tile
            }
        }

        // TODO: Replace with dungeonWalls
        for wall in GenerateWalls(tiles: tiles, wallType: .Wall) {
            buildings[wall.mapPoint] = wall
        }

        // Buildings

        // Monsters
        people.append(PersonData(personId: .Goblin, mapPoint: MapPoint(x: 4, y: 4, location: location), money: 0, inventory: InventoryData()))

        return GameAreaData(location: location,
                            buildings: buildings.compactMap({return $0.value}),
                            terrains: terrains.compactMap({return $0.value}),
                            tiles: tiles.compactMap({return $0.value}),
                            people: people)
    }

    static func getDialogs() -> [Dialog] {
        var data = [Dialog]()

        data.append(contentsOf: getDialogTemp())
        data.append(contentsOf: getDialogLily())
        data.append(contentsOf: getDialogJames())

        return data
    }

    static func GetGameEvents() -> [GameEvent] {
        var data = [GameEvent]()

        data.append(contentsOf: getGameEventGeneric())

        data.append(contentsOf: getGameEventEndDays())
        data.append(contentsOf: getGameEventStores())
        data.append(contentsOf: getGameEventTeleports())
        data.append(contentsOf: getGameEventDialogs())

        data.append(contentsOf: getGameEventLily())
        data.append(contentsOf: getGameEventJames())

        return data
    }

    static func GetSchedules() -> [Schedule] {
        var data = [Schedule]()

        data.append(contentsOf: getSchedules())

        return data
    }

    static private func GenerateWalls(tiles: [MapPoint: TileData], wallType: BuildingId) -> [BuildingData] {

        var wallLocations = [MapPoint: Bool]()

        for tile in tiles {
            // Top Row
            wallLocations[MapPoint(x: tile.key.x-1, y: tile.key.y+1, location: tile.key.location)] = true
            wallLocations[MapPoint(x: tile.key.x+0, y: tile.key.y+1, location: tile.key.location)] = true
            wallLocations[MapPoint(x: tile.key.x+1, y: tile.key.y+1, location: tile.key.location)] = true

            // Mid Row
            wallLocations[MapPoint(x: tile.key.x-1, y: tile.key.y, location: tile.key.location)] = true
            //wallLocations[MapPoint(x: tile.key.x+0, y: tile.key.y, location: tile.key.location)] = true
            wallLocations[MapPoint(x: tile.key.x+1, y: tile.key.y, location: tile.key.location)] = true

            // Bot Row
            wallLocations[MapPoint(x: tile.key.x-1, y: tile.key.y-1, location: tile.key.location)] = true
            wallLocations[MapPoint(x: tile.key.x+0, y: tile.key.y-1, location: tile.key.location)] = true
            wallLocations[MapPoint(x: tile.key.x+1, y: tile.key.y-1, location: tile.key.location)] = true
        }

        for tile in tiles {
            wallLocations[tile.key] = nil
        }

        var walls = [BuildingData]()
        for mapPoint in wallLocations {
            walls.append(BuildingData(playerIndex: .Game, buildingId: wallType, mapPoint: mapPoint.key))
        }

        return walls
    }
}
