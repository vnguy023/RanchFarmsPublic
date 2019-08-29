import SpriteKit

class World: SKNode {
    var player: Person!

    var gameAreas = [GameArea]()
    var npcs = [GameObject]()

    var currentLocation: Location {
        get {return player.location}
        set {player.location = newValue}
    }

    var daysElapsed = Int(0)
    var currentDay: Int {
        get { return daysElapsed + 1 }
    }

    var teleportStartDay = Teleport(position: CGPoint(x: CGFloat(2) * Config.tileSize.width, y: CGFloat(3) * Config.tileSize.height),
                                    location: .House,
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
        player.position = teleport.position
        player.faceDirection = teleport.directionToFace
        currentLocation = teleport.location

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
        player = Person(position: CGPoint(), location: .Farm, personType: .Player)
        player.inventory.items[0] = Item(itemId: .Hoe, quantity: 1)
        player.inventory.items[1] = Item(itemId: .WaterCan, quantity: 1)
        player.inventory.items[2] = Item(itemId: .Axe, quantity: 1)

        player.inventory.items[8] = Item(itemId: .GarlicSeed, quantity: 9)
        player.inventory.items[9] = Item(itemId: .Garlic, quantity: 2)
        player.inventory.items[29] = Item(itemId: .Garlic, quantity: 2)

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
                            position: CGPoint(x: CGFloat(0) * Config.tileSize.width, y: CGFloat(-5) * Config.tileSize.height),
                            location: location)
        door.teleport = Teleport(position: CGPoint(x: CGFloat(3) * Config.tileSize.width, y: CGFloat(5) * Config.tileSize.height),
                                 location: .Farm,
                                 directionToFace: .SOUTH)
        gameArea.buildings.append(door)
        let bed = Building(buildingId: .SingleBed,
                           position: CGPoint(x: CGFloat(3) * Config.tileSize.width, y: CGFloat(3) * Config.tileSize.height),
                           location: location)
        gameArea.buildings.append(bed)

        // Tiles
        for x in -4...4 {
            for y in -4...4 {
                let tileType = TileType.Wood

                let tile = Tile.init(tileType: tileType,
                                     position: CGPoint(x: CGFloat(x) * Config.tileSize.width, y: CGFloat(y) * Config.tileSize.height),
                                     location: location)
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
                            position: CGPoint(x: CGFloat(3) * Config.tileSize.width, y: CGFloat(6) * Config.tileSize.height),
                            location: location)
        houseDoor.teleport = Teleport(position: CGPoint(x: CGFloat(0) * Config.tileSize.width, y: CGFloat(-4) * Config.tileSize.height),
                                     location: .House,
                                     directionToFace: .NORTH)
        gameArea.buildings.append(houseDoor)

        let townDoor = Building(buildingId: .Door,
                                position: CGPoint(x: CGFloat(6) * Config.tileSize.width, y: CGFloat(3) * Config.tileSize.height),
                                location: location)
        townDoor.teleport = Teleport(position: CGPoint(x: CGFloat(6) * Config.tileSize.width, y: CGFloat(3) * Config.tileSize.height),
                                     location: .Town,
                                     directionToFace: .EAST)
        gameArea.buildings.append(townDoor)

        // Tiles
        for x in -5...5 {
            for y in -5...5 {
                var tileType = TileType.Dirt
                if x%2 == 0 {
                    tileType = .Grass
                }

                let tile = Tile.init(tileType: tileType,
                                     position: CGPoint(x: CGFloat(x) * Config.tileSize.width, y: CGFloat(y) * Config.tileSize.height),
                                     location: location)
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
                            position: CGPoint(x: CGFloat(-1) * Config.tileSize.width, y: CGFloat(0) * Config.tileSize.height),
                            location: location)
        door.teleport = Teleport(position: CGPoint(x: CGFloat(5) * Config.tileSize.width, y: CGFloat(3) * Config.tileSize.height),
                                 location: .Farm,
                                 directionToFace: .WEST)
        gameArea.buildings.append(door)

        // Tiles
        for x in 0...10 {
            for y in -5...5 {
                let tileType = TileType.Water

                let tile = Tile.init(tileType: tileType,
                                     position: CGPoint(x: CGFloat(x) * Config.tileSize.width, y: CGFloat(y) * Config.tileSize.height),
                                     location: location)
                gameArea.tiles.append(tile)
            }
        }

        return gameArea
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
