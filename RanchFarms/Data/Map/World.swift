import SpriteKit

class World: SKNode {
    var player: Person!

    var gameAreas = [GameArea]()
    var npcs = [GameObject]()

    var currentLocation: Location {
        get {return player.location}
    }

    var daysElapsed = Int(0)
    var currentDay: Int {
        get { return daysElapsed + 1 }
    }

    let teleportStartDay = Teleport(mapPoint: MapPoint(x: 2, y: -3, location: .House),
                                    directionToFace: .SOUTH)
    // Hud Data
    // This should be temporary data for now. Think about throwing this into global
    var hudInterfaceData = HudInterfaceData()
    
    override init() {
        super.init()
    }

    init(saveLocation: String) {
        super.init()
        loadDefault()

        reloadGameObjects()
    }

    func getCurrentGameArea() -> GameArea {
        return gameAreas.filter({$0.location == currentLocation}).first!
    }

    func getTileAt(position: CGPoint, location: Location) -> Tile? {
        if let gameArea = gameAreas.filter({$0.location == location}).first {
            if let chosenTile = gameArea.tiles.filter({$0.contains(position)}).first {
                return chosenTile
            }
        }

        return nil
    }

    func getBuildingAt(position: CGPoint, location: Location) -> Building? {
        if let gameArea = gameAreas.filter({$0.location == location}).first {
            if let chosenBuilding = gameArea.buildings.filter({$0.contains(position)}).first {
                return chosenBuilding
            }
        }

        return nil
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
        }
    }

    private func loadDefault() {
        player = Person(mapPoint: MapPoint(x: 0, y: 0, location: .Farm), personType: .Player)
        player.inventory.items[0] = Item(itemId: .Hoe, quantity: 1)
        player.inventory.items[1] = Item(itemId: .WaterCan, quantity: 1)
        player.inventory.items[2] = Item(itemId: .Axe, quantity: 1)
        player.inventory.items[3] = Item(itemId: .PickAxe, quantity: 1)

        player.inventory.items[8] = Item(itemId: .GarlicSeed, quantity: 9)
        player.inventory.items[9] = Item(itemId: .Garlic, quantity: 5)
        player.inventory.items[28] = Item(itemId: .Garlic, quantity: 990)
        player.inventory.items[29] = Item(itemId: .Garlic, quantity: 5)

        gameAreas.append(sampleHouse())
        gameAreas.append(sampleFarm())
        gameAreas.append(sampleTown())
    }

    private func sampleHouse() -> GameArea {
        let location = Location.House

        let gameArea = GameArea()
        gameArea.location = location

        //Buildings
        let door = Building(buildingId: .Door,
                            mapPoint: MapPoint(x: 0, y: -5, location: location))
        door.teleport = Teleport(mapPoint: MapPoint(x: 3, y: 5, location: .Farm),
                                 directionToFace: .SOUTH)
        gameArea.buildings.append(door)
        let bed = Building(buildingId: .SingleBed,
                           mapPoint: MapPoint(x: 3, y: -3, location: location))
        gameArea.buildings.append(bed)

        // Tiles
        for x in -4...4 {
            for y in -4...4 {
                let tileType = TileType.Wood

                let tile = Tile.init(tileType: tileType,
                                     mapPoint: MapPoint(x: x, y: y, location: location))
                gameArea.tiles.append(tile)
            }
        }

        return gameArea
    }

    private func sampleFarm() -> GameArea {
        let location = Location.Farm

        let gameArea = GameArea()
        gameArea.location = location

        //Buildings
        let houseDoor = Building(buildingId: .Door,
                                 mapPoint: MapPoint(x: 3, y: 6, location: location))
        houseDoor.teleport = Teleport(mapPoint: MapPoint(x: 0, y: -4, location: .House),
                                     directionToFace: .NORTH)
        gameArea.buildings.append(houseDoor)

        let townDoor = Building(buildingId: .Door,
                                mapPoint: MapPoint(x: 6, y: 3, location: location))
        townDoor.teleport = Teleport(mapPoint: MapPoint(x: 0, y: 0, location: .Town),
                                     directionToFace: .EAST)
        gameArea.buildings.append(townDoor)

        let farmSellBox = Building(buildingId: .FarmSellBox,
                                mapPoint: MapPoint(x: 5, y: 6, location: location))
        gameArea.buildings.append(farmSellBox)

        let garlic = Building(buildingId: .Garlic,
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
        let door = Building(buildingId: .Door,
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

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
