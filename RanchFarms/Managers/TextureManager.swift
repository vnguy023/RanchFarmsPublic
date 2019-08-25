import SpriteKit

class TextureManager {
    static let shared = TextureManager()

    private var hudMap = [String: SKTexture]()
    private var buildingMap = [BuildingId: SKTexture]()
    private var itemMap = [ItemId: SKTexture]()
    private var tileMap = [TileType: SKTexture]()

    private var personMap = [String: SKTexture]()

    private init() {
        loadHud()

        loadBuildings()
        loadItems()
        loadTiles()

        loadPeople()

        postProcess()
    }

    private func loadHud() {
        hudMap["hudItemBorder"] = SKTexture(imageNamed: "hudItemBorder")
        hudMap["hudItemBorderHighlight"] = SKTexture(imageNamed: "hudItemBorderHighlight")
        hudMap["hudItemBorderShadow"] = SKTexture(imageNamed: "hudItemBorderShadow")
        hudMap["hudTileCursor"] = SKTexture(imageNamed: "hudTileCursor")
    }

    private func loadBuildings() {
        buildingMap[.Door] = SKTexture(imageNamed: "buildingDoor")
        buildingMap[.SingleBed] = SKTexture(imageNamed: "buildingSingleBed")
        buildingMap[.Rock] = SKTexture(imageNamed: "buildingRock")

        buildingMap[.Garlic] = SKTexture(imageNamed: "buildingGarlic1")
    }

    private func loadItems() {
        itemMap[.Axe] = SKTexture(imageNamed: "itemAxe")
        itemMap[.Hoe] = SKTexture(imageNamed: "itemHoe")

        itemMap[.GarlicSeed] = SKTexture(imageNamed: "itemGarlicSeed")
        itemMap[.Garlic] = SKTexture(imageNamed: "itemGarlic")
    }

    private func loadTiles() {
        tileMap[.Dirt] = SKTexture(imageNamed: "tileDirt")
        tileMap[.Grass] = SKTexture(imageNamed: "tileGrass")
        tileMap[.Water] = SKTexture(imageNamed: "tileWater")
        tileMap[.TilledDirt] = SKTexture(imageNamed: "tileTilledDirt")
    }

    func getTexture(hudImageName: String) -> SKTexture? {
        if hudMap[hudImageName] == nil {
            print ("[TextureManager] [Desc=No texture] [hudImageName=\(hudImageName)]")
        } else {
            return hudMap[hudImageName]
        }
        return nil
    }

    func getTexture(buildingId: BuildingId) -> SKTexture? {
        if buildingMap[buildingId] == nil {
            print ("[TextureManager] [Desc=No texture] [BuildingType=\(buildingId)]")
        } else {
            return buildingMap[buildingId]
        }
        return nil
    }

    func getTexture(itemId: ItemId) -> SKTexture? {
        if itemMap[itemId] == nil {
            print ("[TextureManager] [Desc=No texture] [ItemType=\(itemId)]")
        } else {
            return itemMap[itemId]
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

    func getTexture(personTextureName: String) -> SKTexture? {
        if personMap[personTextureName] == nil {
            print ("[TextureManager] [Desc=No texture] [PersonTextureName=\(personTextureName)]")
        } else {
            return personMap[personTextureName]
        }
        return nil
    }

    func loadPeople() {
        personMap["playerIdleUp"] = SKTexture.init(imageNamed: "personPlayerIdleUp")
        personMap["playerIdleDown"] = SKTexture.init(imageNamed: "personPlayerIdleDown")
        personMap["playerIdleLeft"] = SKTexture.init(imageNamed: "personPlayerIdleLeft")
        personMap["playerIdleRight"] = SKTexture.init(imageNamed: "personPlayerIdleRight")
    }

    private func postProcess () {
        hudMap.forEach({$0.value.filteringMode = .nearest})

        buildingMap.forEach({$0.value.filteringMode = .nearest})
        itemMap.forEach({$0.value.filteringMode = .nearest})
        tileMap.forEach({$0.value.filteringMode = .nearest})

        personMap.forEach({$0.value.filteringMode = .nearest})
    }
}
