import SpriteKit

class World: SKNode {

    var player: Person!

    var gameAreas = [GameArea]()
    var npcs = [GameObject]()
    var buildings = [GameObject]()
    var envItems = [GameObject]()

    var currentLocation: Location {
        get {return player.location}
        set {player.location = newValue}
    }
    
    override init() {
        super.init()
    }

    init(saveLocation: String) {
        super.init()
        loadDefault()

        reloadGameObjects()
    }

    func changeLocation(to newLocation: Location, playerPosition: CGPoint) {
        player.position = playerPosition
        currentLocation = newLocation
        reloadGameObjects()
    }

    func reloadGameObjects() {
        self.removeAllChildren()

        self.addChild(player)

        for gameArea in gameAreas.filter({$0.location == currentLocation}) {
            for tile in gameArea.tiles {
                self.addChild(tile)
            }
        }
    }

    private func loadDefault() {
        player = Person(position: CGPoint(), location: .Farm)
        player.inventory.items[2] = Item(itemType: .Axe, quantity: 2)
        player.inventory.items[5] = Item(itemType: .Axe, quantity: 1)
        player.inventory.items[6] = Item(itemType: .Axe, quantity: 3)

        gameAreas.append(sampleFarm())
        gameAreas.append(sampleTown())
    }

    private func sampleFarm() -> GameArea {
        let gameArea = GameArea()
        gameArea.location = Location.Farm

        for x in -5...5 {
            for y in -5...5 {
                var tileType = TileType.Dirt
                if x%2 == 0 {
                    tileType = .Grass
                }

                let tile = Tile.init(tileType: tileType,
                                     position: CGPoint(x: CGFloat(x) * Config.tileSize.width, y: CGFloat(y) * Config.tileSize.height),
                                     location: gameArea.location)
                gameArea.tiles.append(tile)
            }
        }

        return gameArea
    }

    private func sampleTown() -> GameArea {
        let gameArea = GameArea()
        gameArea.location = Location.Town

        for x in 0...10 {
            for y in -5...5 {
                let tileType = TileType.Water

                let tile = Tile.init(tileType: tileType,
                                     position: CGPoint(x: CGFloat(x) * Config.tileSize.width, y: CGFloat(y) * Config.tileSize.height),
                                     location: gameArea.location)
                gameArea.tiles.append(tile)
            }
        }

        return gameArea
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
