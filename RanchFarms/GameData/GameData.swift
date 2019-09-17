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
        let door = BuildingData(playerIndex: .Game,
                                buildingId: .HouseToFarmDoor,
                                mapPoint: MapPoint(x: 1, y: -2, location: location))
        buildings.append(door)

        let bed = BuildingData(playerIndex: .Game,
                               buildingId: .SingleBed,
                               mapPoint: MapPoint(x: 8, y: 0, location: location))
        buildings.append(bed)

        // Tiles/Terrains
        for x in 0...9 {
            for y in 0...6 {
                let tile = TileData(playerIndex: .Game,
                                    tileType: .Dirt,
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

        let vendingMachine = BuildingData(playerIndex: .Game,
                                          buildingId: .VendingMachine,
                                          mapPoint: MapPoint(x: 1, y: 6, location: location))
        buildings.append(vendingMachine)

        // Tiles/Terrains
        for x in -5...5 {
            for y in -5...6 {
                var tileType = TileType.Dirt
                if x%2 == 0 {
                    tileType = .Grass
                }

                let tile = TileData(playerIndex: .Game,
                                    tileType: tileType,
                                    mapPoint: MapPoint(x: x, y: y, location: location))
                tiles.append(tile)
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

        // Tiles/Terrains
        for x in 0...10 {
            for y in -5...5 {
                let tile = TileData(playerIndex: .Game,
                                    tileType: .Water,
                                    mapPoint: MapPoint(x: x, y: y, location: location))
                tiles.append(tile)
            }
        }

        return GameAreaData(location: location, buildings: buildings, terrains: terrains, tiles: tiles)
    }
}
