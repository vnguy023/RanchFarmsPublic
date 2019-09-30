class GameData {

    static func GetTeleportStartDay() -> TeleportId {
        return .House_Bed
    }

    static func BasicHouse() -> GameAreaData {
        let location = Location.House

        var buildings = [BuildingData]()
        var terrains = [TerrainData]()
        var tiles = [TileData]()

        // Buildings
        let bed = BuildingData(playerIndex: .Game,
                               buildingId: .SingleBed,
                               mapPoint: MapPoint(x: 8, y: 0, location: location))
        buildings.append(bed)

        for x in -1...10 {
            if x != 1 {
                let wall = BuildingData(playerIndex: .Game,
                                        buildingId: .Wall,
                                        mapPoint: MapPoint(x: x, y: -1, location: location))
                buildings.append(wall)
            }
        }

        for x in -1...10 {
            let wall = BuildingData(playerIndex: .Game,
                                    buildingId: .Wall,
                                    mapPoint: MapPoint(x: x, y: 7, location: location))
            buildings.append(wall)
        }

        for y in 0...6 {
            let wall = BuildingData(playerIndex: .Game,
                                    buildingId: .Wall,
                                    mapPoint: MapPoint(x: -1, y: y, location: location))
            buildings.append(wall)
        }

        for y in 0...6 {
            let wall = BuildingData(playerIndex: .Game,
                                    buildingId: .Wall,
                                    mapPoint: MapPoint(x: 10, y: y, location: location))
            buildings.append(wall)
        }

        // Tiles/Terrains
        for x in 0...9 {
            for y in 0...6 {
                let tile = TileData(tileId: .Dirt,
                                    mapPoint: MapPoint(x: x, y: y, location: location))
                tiles.append(tile)

                let terrain = TerrainData(playerIndex: .Game,
                                          terrainType: .Wood,
                                          mapPoint: MapPoint(x: x, y: y, location: location))
                terrains.append(terrain)
            }
        }

        for x in 1...1 {
            for y in (-2)...(-1) {
                let tile = TileData(tileId: .Dirt,
                                    mapPoint: MapPoint(x: x, y: y, location: location))
                tiles.append(tile)

                let terrain = TerrainData(playerIndex: .Game,
                                          terrainType: .Wood,
                                          mapPoint: MapPoint(x: x, y: y, location: location))
                terrains.append(terrain)
            }
        }
        return GameAreaData(location: location, buildings: buildings, terrains: terrains, tiles: tiles)
    }

    static func Farm() -> GameAreaData {
        let location = Location.Farm

        var buildings = [BuildingData]()
        let terrains = [TerrainData]()
        var tiles = [TileData]()

        // Buildings
        let farmHouse = BuildingData(playerIndex: .Game,
                                     buildingId: .FarmHouse,
                                     mapPoint: MapPoint(x: 1, y: 7, location: location))
        buildings.append(farmHouse)

        let houseDoor = BuildingData(playerIndex: .Game,
                                     buildingId: .FarmToHouseDoor,
                                     mapPoint: MapPoint(x: 3, y: 7, location: location))
        buildings.append(houseDoor)

        let townDoor = BuildingData(playerIndex: .Game,
                                    buildingId: .FarmToTownDoor,
                                    mapPoint: MapPoint(x: 6, y: 3, location: location))
        buildings.append(townDoor)

        let farmDeliveryBox = BuildingData(playerIndex: .Game,
                                           buildingId: .FarmDeliveryBox,
                                           mapPoint: MapPoint(x: 5, y: 6, location: location))
        buildings.append(farmDeliveryBox)

        let sign = BuildingData(playerIndex: .Game,
                                buildingId: .PlayerHouseSign,
                                mapPoint: MapPoint(x: 4, y: 6, location: location))
        buildings.append(sign)

        // Tiles/Terrains
        for x in -5...5 {
            for y in -5...6 {
                var tileId = TileId.Dirt
                if x%2 == 0 {
                    tileId = .Grass
                }

                let tile = TileData(tileId: tileId,
                                    mapPoint: MapPoint(x: x, y: y, location: location))
                tiles.append(tile)
            }
        }

        return GameAreaData(location: location, buildings: buildings, terrains: terrains, tiles: tiles)
    }

    static func SouthBeach() -> GameAreaData {
        let location = Location.SouthBeach

        let buildings = [BuildingData]()
        var terrains = [TerrainData]()
        var tiles = [TileData]()

        // Buildings

        // Tiles/Terrains
        for x in 0...15 {
            for y in (-4)...(0) {
                let tile = TileData(tileId: .Sand,
                                    mapPoint: MapPoint(x: x, y: y, location: location))
                tiles.append(tile)
            }

            for y in (-10)...(-5) {
                let tile = TileData(tileId: .Water,
                                    mapPoint: MapPoint(x: x, y: y, location: location))
                tiles.append(tile)
            }
        }

        // SouthBeachTownDoor
        for x in 4...4 {
            for y in (1)...(2) {
                let tile = TileData(tileId: .Grass,
                                    mapPoint: MapPoint(x: x, y: y, location: location))
                tiles.append(tile)
            }
        }


        for x in 2...3 {
            for y in (-8)...(-4) {
                let terrain = TerrainData(playerIndex: .Game,
                                          terrainType: .Wood,
                                          mapPoint: MapPoint(x: x, y: y, location: location))
                terrains.append(terrain)
            }
        }

        return GameAreaData(location: location, buildings: buildings, terrains: terrains, tiles: tiles)
    }

    static func Town() -> GameAreaData {
        let location = Location.Town

        var buildings = [BuildingData]()
        let terrains = [TerrainData]()
        var tiles = [TileData]()

        // Buildings
        let farmDoor = BuildingData(playerIndex: .Game,
                                    buildingId: .TownToFarmDoor,
                                    mapPoint: MapPoint(x: -1, y: 0, location: location))
        buildings.append(farmDoor)

        // Buildings
        let generalStoreDoor = BuildingData(playerIndex: .Game,
                                            buildingId: .TownToGeneralStoreDoor,
                                            mapPoint: MapPoint(x: 2, y: 6, location: location))
        buildings.append(generalStoreDoor)

        // Tiles/Terrains
        for x in 0...10 {
            for y in -5...5 {
                let tile = TileData(tileId: .Grass,
                                    mapPoint: MapPoint(x: x, y: y, location: location))
                tiles.append(tile)
            }
        }

        for x in 4...4 {
            for y in (-7)...(-6) {
                let tile = TileData(tileId: .Sand,
                                    mapPoint: MapPoint(x: x, y: y, location: location))
                tiles.append(tile)
            }
        }

        return GameAreaData(location: location, buildings: buildings, terrains: terrains, tiles: tiles)
    }

    static func GeneralStore() -> GameAreaData {
        let location = Location.GeneralStore

        var buildings = [BuildingData]()
        var terrains = [TerrainData]()
        var tiles = [TileData]()

        // Buildings
        let vendingMachine = BuildingData(playerIndex: .Game,
                                          buildingId: .VendingMachine,
                                          mapPoint: MapPoint(x: 1, y: 4, location: location))
        buildings.append(vendingMachine)

        for x in -1...5 {
            if x != 1 {
                let wall = BuildingData(playerIndex: .Game,
                                        buildingId: .Wall,
                                        mapPoint: MapPoint(x: x, y: -1, location: location))
                buildings.append(wall)
            }
        }

        for x in -1...5 {
            let wall = BuildingData(playerIndex: .Game,
                                    buildingId: .Wall,
                                    mapPoint: MapPoint(x: x, y: 5, location: location))
            buildings.append(wall)
        }

        for y in 0...4 {
            let wall = BuildingData(playerIndex: .Game,
                                    buildingId: .Wall,
                                    mapPoint: MapPoint(x: -1, y: y, location: location))
            buildings.append(wall)
        }

        for y in 0...4 {
            let wall = BuildingData(playerIndex: .Game,
                                    buildingId: .Wall,
                                    mapPoint: MapPoint(x: 5, y: y, location: location))
            buildings.append(wall)
        }

        // Tiles/Terrains
        for x in 0...4 {
            for y in 0...4 {
                let tile = TileData(tileId: .Dirt,
                                    mapPoint: MapPoint(x: x, y: y, location: location))
                tiles.append(tile)

                let terrain = TerrainData(playerIndex: .Game,
                                          terrainType: .Wood,
                                          mapPoint: MapPoint(x: x, y: y, location: location))
                terrains.append(terrain)
            }
        }

        for x in 1...1 {
            for y in (-2)...(-1) {
                let tile = TileData(tileId: .Dirt,
                                    mapPoint: MapPoint(x: x, y: y, location: location))
                tiles.append(tile)

                let terrain = TerrainData(playerIndex: .Game,
                                          terrainType: .Wood,
                                          mapPoint: MapPoint(x: x, y: y, location: location))
                terrains.append(terrain)
            }
        }

        return GameAreaData(location: location, buildings: buildings, terrains: terrains, tiles: tiles)
    }

    static func getDialogs() -> [Dialog] {
        var data = [Dialog]()

        data.append(contentsOf: getDialogTemp())
        data.append(contentsOf: getDialogLily())

        return data
    }

    static func GetGameEvents() -> [GameEvent] {
        var data = [GameEvent]()

        data.append(contentsOf: getGameEventStores())
        data.append(contentsOf: getGameEventTeleports())
        data.append(contentsOf: getGameEventDialogs())

        data.append(contentsOf: getGameEventLily())

        return data
    }

    static func GetSchedules() -> [Schedule] {
        var data = [Schedule]()

        data.append(contentsOf: getSchedules())

        return data
    }

}
