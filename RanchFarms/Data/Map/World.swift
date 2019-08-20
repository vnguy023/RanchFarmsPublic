import SpriteKit

class World: SKNode {
    var gameAreas = [GameArea]()
    var npcs = [GameObject]()
    var buildings = [GameObject]()
    var envItems = [GameObject]()

    var currentLocation = Location.Farm
    
    override init() {
        super.init()
    }

    init(saveLocation: String) {
        super.init()
        loadDefault()

        currentLocation = .Farm

        preloadGameObjects()
    }

    func preloadGameObjects() {
        self.removeAllChildren()

        for gameArea in gameAreas.filter({$0.location == currentLocation}) {
            for tile in gameArea.tiles {
                self.addChild(tile)
            }
        }
    }

    private func loadDefault() {
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

                let tile = Tile.init(tileType: tileType, position: CGPoint(x: x*32, y: y*32), location: gameArea.location)
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

                let tile = Tile.init(tileType: tileType, position: CGPoint(x: x*32, y: y*32), location: gameArea.location)
                gameArea.tiles.append(tile)
            }
        }

        return gameArea
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
