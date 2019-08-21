import SpriteKit

class TextureManager {
    static let shared = TextureManager()

    private var hudMap = [String:SKTexture]()
    private var itemMap = [ItemType:SKTexture]()
    private var tileMap = [TileType:SKTexture]()

    private init() {
        loadHud()
        loadItems()
        loadTiles()

        postProcess()
    }

    private func loadHud() {
        hudMap["hudItemBorder"] = SKTexture(imageNamed: "hudItemBorder")
        hudMap["hudItemBorderHighlight"] = SKTexture(imageNamed: "hudItemBorderHighlight")
        hudMap["hudItemBorderShadow"] = SKTexture(imageNamed: "hudItemBorderShadow")
    }

    private func loadItems() {
        itemMap[.Axe] = SKTexture(imageNamed: "itemAxe")
    }

    private func loadTiles() {
        tileMap[.Dirt] = SKTexture(imageNamed: "tileDirt")
        tileMap[.Grass] = SKTexture(imageNamed: "tileGrass")
        tileMap[.Water] = SKTexture(imageNamed: "tileWater")
    }

    func getTexture(hudImageName: String) -> SKTexture? {
        if hudMap[hudImageName] == nil {
            print ("[TextureManager] [Desc=No texture] [hudImageName=\(hudImageName)]")
        } else {
            return hudMap[hudImageName]
        }
        return nil
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
        hudMap.forEach({$0.value.filteringMode = .nearest})
        itemMap.forEach({$0.value.filteringMode = .nearest})
        tileMap.forEach({$0.value.filteringMode = .nearest})
    }
}
