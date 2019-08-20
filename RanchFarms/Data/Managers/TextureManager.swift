import SpriteKit

class TextureManager {
    static let shared = TextureManager()

    private var tileMap = [TileType:SKTexture]()

    private init() {
        loadTiles()

        postProcess()
    }

    func getTexture(tileType: TileType) -> SKTexture? {
        if tileMap[tileType] == nil {
            print ("[TextureManager] [Desc=No texture] [TileType\(tileType)]")
        } else {
            return tileMap[tileType]
        }
        return nil
    }

    private func loadTiles() {
        tileMap[.Dirt] = SKTexture(imageNamed: "tileDirt")
        tileMap[.Grass] = SKTexture(imageNamed: "tileGrass")
        tileMap[.Water] = SKTexture(imageNamed: "tileWater")
    }

    private func postProcess () {
        for texture in tileMap {
            texture.value.filteringMode = .nearest
        }
    }
}
