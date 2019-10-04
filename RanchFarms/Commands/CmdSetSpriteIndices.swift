import Foundation

class CmdSetSpriteIndices: Command {
    // Input
    var gameArea: GameArea!


    // InternalData
    var uniqueTileIds = [TileId: Bool]()
    var tileMap = [MapPoint: Tile]()
    var tileMapTileIdFilter = [TileId: [MapPoint: Tile]]()

    var uniqueTerrainTypes = [TerrainType: Bool]()
    var terrainMap = [MapPoint: Terrain]()
    var terrainMapTerrainTypeFilter = [TerrainType: [MapPoint: Terrain]]()

    var wallMap = [MapPoint: Building]()

    init(gameArea: GameArea) {
        self.gameArea = gameArea
    }

    func execute() {
        preprocess()
        processTiles()
        processTerrains()
        processWalls()
    }

    private func preprocess() {
        for tile in gameArea.tiles {
            uniqueTileIds[tile.id] = true
            tileMap[tile.mapPoint] = tile
        }
        for tileId in uniqueTileIds{
            tileMapTileIdFilter[tileId.key] = [MapPoint:Tile]()
        }
        for tile in gameArea.tiles {
            tileMapTileIdFilter[tile.id]![tile.mapPoint] = tile
        }

        for terrain in gameArea.terrains {
            uniqueTerrainTypes[terrain.type] = true
            terrainMap[terrain.mapPoint] = terrain
        }
        for terrainType in uniqueTerrainTypes {
            terrainMapTerrainTypeFilter[terrainType.key] = [MapPoint:Terrain]()
        }
        for terrain in gameArea.terrains {
            terrainMapTerrainTypeFilter[terrain.type]![terrain.mapPoint] = terrain
        }

        for wall in gameArea.buildings.filter({$0.id == .Wall}) {
            wallMap[wall.mapPoint] = wall
        }
    }

    private func processTiles() {
        for tile in gameArea.tiles {
            if !tile.info.hasSpriteIndices {
                continue
            }

            var neighbors = Set<CGVector>()

            var north = tile.mapPoint
            north.y += 1
            if tileMapTileIdFilter[tile.id]![north] != nil {
                neighbors.insert(CGVector.NORTH)
            }

            var south = tile.mapPoint
            south.y -= 1
            if tileMapTileIdFilter[tile.id]![south] != nil {
                neighbors.insert(CGVector.SOUTH)
            }

            var west = tile.mapPoint
            west.x -= 1
            if tileMapTileIdFilter[tile.id]![west] != nil {
                neighbors.insert(CGVector.WEST)
            }

            var east = tile.mapPoint
            east.x += 1
            if tileMapTileIdFilter[tile.id]![east] != nil {
                neighbors.insert(CGVector.EAST)
            }

            tile.spriteIndex = SpriteIndex.getSpriteIndex(neighbors: neighbors)
        }
    }

    private func processTerrains() {
        for terrain in gameArea.terrains {
            if !terrain.info.hasSpriteIndices {
                continue
            }

            var neighbors = Set<CGVector>()

            var north = terrain.mapPoint
            north.y += 1
            if terrainMapTerrainTypeFilter[terrain.type]![north] != nil {
                neighbors.insert(CGVector.NORTH)
            }

            var south = terrain.mapPoint
            south.y -= 1
            if terrainMapTerrainTypeFilter[terrain.type]![south] != nil {
                neighbors.insert(CGVector.SOUTH)
            }

            var west = terrain.mapPoint
            west.x -= 1
            if terrainMapTerrainTypeFilter[terrain.type]![west] != nil {
                neighbors.insert(CGVector.WEST)
            }

            var east = terrain.mapPoint
            east.x += 1
            if terrainMapTerrainTypeFilter[terrain.type]![east] != nil {
                neighbors.insert(CGVector.EAST)
            }

            terrain.spriteIndex = SpriteIndex.getSpriteIndex(neighbors: neighbors)
        }
    }

    private func processWalls() {
        for wall in wallMap {
            if !wall.value.buildingInfo.hasSpriteIndices {
                continue
            }

            var neighbors = Set<CGVector>()

            var north = wall.key
            north.y += 1
            if tileMap[north] != nil || wallMap[north] != nil {
                neighbors.insert(CGVector.NORTH)
            }

            var south = wall.key
            south.y -= 1
            if tileMap[south] != nil || wallMap[south] != nil {
                neighbors.insert(CGVector.SOUTH)
            }

            var west = wall.key
            west.x -= 1
            if tileMap[west] != nil || wallMap[west] != nil {
                neighbors.insert(CGVector.WEST)
            }

            var east = wall.key
            east.x += 1
            if tileMap[east] != nil || wallMap[east] != nil {
                neighbors.insert(CGVector.EAST)
            }

            wall.value.spriteIndex = SpriteIndex.getSpriteIndex(neighbors: neighbors)

            if wall.value.spriteIndex == SpriteIndex.Center {
                neighbors.removeAll()
                var north = wall.key
                north.y += 1
                if tileMap[north] != nil {
                    neighbors.insert(CGVector.NORTH)
                }

                var south = wall.key
                south.y -= 1
                if tileMap[south] != nil {
                    neighbors.insert(CGVector.SOUTH)
                }

                var west = wall.key
                west.x -= 1
                if tileMap[west] != nil {
                    neighbors.insert(CGVector.WEST)
                }

                var east = wall.key
                east.x += 1
                if tileMap[east] != nil {
                    neighbors.insert(CGVector.EAST)
                }
                wall.value.spriteIndex = SpriteIndex.getSpriteIndexWall(neighbors: neighbors)
            }
        }
    }
}
