import Foundation

class CmdSetSpriteIndices: Command {
    // Input
    var gameArea: GameArea!


    // InternalData
    var uniqueTileIds = [TileId: Bool]()
    var tileMap = [TileId: [MapPoint: Tile]]()

    init(gameArea: GameArea) {
        self.gameArea = gameArea
    }

    func execute() {
        preprocess()

        for tile in gameArea.tiles {
            if !tile.info.hasSpriteIndices {
                continue
            }

            var neighbors = Set<CGVector>()

            var north = tile.mapPoint
            north.y += 1
            if tileMap[tile.id]![north] != nil {
                neighbors.insert(CGVector.NORTH)
            }

            var south = tile.mapPoint
            south.y -= 1
            if tileMap[tile.id]![south] != nil {
                neighbors.insert(CGVector.SOUTH)
            }

            var west = tile.mapPoint
            west.x -= 1
            if tileMap[tile.id]![west] != nil {
                neighbors.insert(CGVector.WEST)
            }

            var east = tile.mapPoint
            east.x += 1
            if tileMap[tile.id]![east] != nil {
                neighbors.insert(CGVector.EAST)
            }

            tile.spriteIndex = SpriteIndex.getSpriteIndex(neighbors: neighbors)

            if tile.spriteIndex != nil {
                print ("yay we assigned a spriteIndex")
            }
        }
    }

    private func preprocess() {
        for tile in gameArea.tiles {
            uniqueTileIds[tile.id] = true
        }

        for tileId in uniqueTileIds{
            tileMap[tileId.key] = [MapPoint:Tile]()

            for tile in gameArea.tiles.filter({$0.id == tileId.key}) {
                tileMap[tile.id]![tile.mapPoint] = tile
            }
        }
    }
}
