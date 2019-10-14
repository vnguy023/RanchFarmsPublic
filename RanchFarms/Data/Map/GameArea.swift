import SpriteKit

class GameArea {
    var location = Location(gameAreaId: .Farm)

    var buildings = [Building]()
    var terrains = [Terrain]()
    var tiles = [Tile]()
    var people = [Person]()

    init() {
    }

    func getGameAreasFilter(player: PlayerIndex) -> GameAreaData {
        // don't store monsters people for now
        return GameAreaData(location: location,
                            buildings: buildings.filter({$0.player == player}).map({return $0.getBuildingData()}),
                            terrains: terrains.filter({$0.player == player}).map({return $0.getTerrainData()}),
                            tiles: tiles.filter({$0.player == player}).map({return $0.getTileData()}),
                            people: [PersonData]())
    }
}
