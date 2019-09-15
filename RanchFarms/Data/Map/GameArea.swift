import SpriteKit

class GameArea {
    var location = Location.Farm

    var buildings = [Building]()
    var terrains = [Terrain]()
    var tiles = [Tile]()

    init() {
    }

    func getGameAreasFilter(player: PlayerIndex) -> GameAreaData {
        return GameAreaData(location: location,
                            buildings: buildings.filter({$0.player == player}).map({return $0.getBuildingData()}),
                            terrains: terrains.filter({$0.player == player}).map({return $0.getTerrainData()}),
                            tiles: tiles.filter({$0.player == player}).map({return $0.getTileData()}))
    }
}
