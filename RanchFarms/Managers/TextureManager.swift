import SpriteKit

class TextureManager {
    static let shared = TextureManager()

    private var hudMap = [String: SKTexture]()
    private var buildingMap = [BuildingType: SKTexture]()
    private var itemMap = [ItemType: SKTexture]()
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
    }

    private func loadBuildings() {
        buildingMap[.Door] = SKTexture(imageNamed: "buildingDoor")
        buildingMap[.SingleBed] = SKTexture(imageNamed: "buildingSingleBed")
        buildingMap[.Rock] = SKTexture(imageNamed: "buildingRock")
    }

    private func loadItems() {
        itemMap[.Axe] = SKTexture(imageNamed: "itemAxe")
        itemMap[.Hoe] = SKTexture(imageNamed: "itemHoe")
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

    func getTexture(buildingType: BuildingType) -> SKTexture? {
        if buildingMap[buildingType] == nil {
            print ("[TextureManager] [Desc=No texture] [BuildingType=\(buildingType)]")
        } else {
            return buildingMap[buildingType]
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
