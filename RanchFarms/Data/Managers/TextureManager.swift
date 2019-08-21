import SpriteKit

class TextureManager {
    static let shared = TextureManager()

    private var tileMap = [TileType:SKTexture]()
    private var itemMap = [ItemType:SKTexture]()

    private init() {
        loadItems()
        loadTiles()

        postProcess()
    }

    private func loadItems() {
        itemMap[.Axe] = SKTexture(imageNamed: "itemAxe")
    }

    private func loadTiles() {
        tileMap[.Dirt] = SKTexture(imageNamed: "tileDirt")
        tileMap[.Grass] = SKTexture(imageNamed: "tileGrass")
        tileMap[.Water] = SKTexture(imageNamed: "tileWater")
    }

    func getTexture(itemType: ItemType) -> SKTexture? {
        if itemMap[itemType] == nil {
            print ("[TextureManager] [Desc=No texture] [ItemType=\(itemType)]")
        } else {
            return itemMap[itemType]
        }
        return nil
    }

    func getTexture(tileType: TileType) -> SKTexture? {
        if tileMap[tileType] == nil {
            print ("[TextureManager] [Desc=No texture] [TileType=\(tileType)]")
        } else {
            return tileMap[tileType]
        }
        return nil
    }

    private func postProcess () {
        for texture in tileMap {
            texture.value.filteringMode = .nearest
        }
    }
}
