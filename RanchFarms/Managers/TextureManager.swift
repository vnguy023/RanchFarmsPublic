import SpriteKit

class TextureManager {
    static let shared = TextureManager()

    private var hudMap = [String: SKTexture]()
    private var buildingMap = [BuildingId: SKTexture]()
    private var cropMap = [String: SKTexture]()
    private var itemMap = [ItemId: SKTexture]()
    private var tileMap = [TileType: SKTexture]()

    private var personMap = [String: SKTexture]()
    private var portraitMap = [PortraitId: SKTexture]()

    private init() {
        loadHud()

        loadBuildings()
        loadCrops()
        loadItems()
        loadTiles()

        loadPeople()
        loadPortraits()

        postProcess()
    }

    private func loadHud() {
        hudMap["hudItemBorder"] = SKTexture(imageNamed: "hudItemBorder")
        hudMap["hudItemBorderSelect"] = SKTexture(imageNamed: "hudItemBorderSelect")
        hudMap["hudItemBorderHighlight"] = SKTexture(imageNamed: "hudItemBorderHighlight")
        hudMap["hudItemBorderShadow"] = SKTexture(imageNamed: "hudItemBorderShadow")
        hudMap["hudTileCursor"] = SKTexture(imageNamed: "hudTileCursor")
    }

    private func loadBuildings() {
        buildingMap[.Door] = SKTexture(imageNamed: "buildingDoor")
        buildingMap[.SingleBed] = SKTexture(imageNamed: "buildingSingleBed")
        buildingMap[.Rock] = SKTexture(imageNamed: "buildingRock")
        buildingMap[.FarmDeliveryBox] = SKTexture(imageNamed: "buildingChest")

        buildingMap[.Chair] = SKTexture(imageNamed: "buildingChair")
        buildingMap[.Table] = SKTexture(imageNamed: "buildingTable")
        buildingMap[.TV] = SKTexture(imageNamed: "buildingTv")

        buildingMap[.VendingMachine] = SKTexture(imageNamed: "buildingVendingMachine")
        buildingMap[.PlayerHouseSign] = SKTexture(imageNamed: "buildingSign")
    }

    private func loadCrops() {
        cropMap["garlic1"] = SKTexture(imageNamed: "buildingGarlic1")
        cropMap["garlic2"] = SKTexture(imageNamed: "buildingGarlic2")
        cropMap["garlic3"] = SKTexture(imageNamed: "buildingGarlic3")
        cropMap["garlic4"] = SKTexture(imageNamed: "buildingGarlic4")
        cropMap["garlic5"] = SKTexture(imageNamed: "buildingGarlic5")
        cropMap["garlic6"] = SKTexture(imageNamed: "buildingGarlic6")
    }

    private func loadItems() {
        itemMap[.Axe] = SKTexture(imageNamed: "itemAxe")
        itemMap[.Hoe] = SKTexture(imageNamed: "itemHoe")
        itemMap[.PickAxe] = SKTexture(imageNamed: "itemPickAxe")
        itemMap[.WaterCan] = SKTexture(imageNamed: "itemWatercan")

        itemMap[.GarlicSeed] = SKTexture(imageNamed: "itemGarlicSeed")
        itemMap[.Garlic] = SKTexture(imageNamed: "itemGarlic")
    }

    func loadPeople() {
        personMap["playerIdleUp"] = SKTexture.init(imageNamed: "personPlayerIdleUp")
        personMap["playerIdleDown"] = SKTexture.init(imageNamed: "personPlayerIdleDown")
        personMap["playerIdleLeft"] = SKTexture.init(imageNamed: "personPlayerIdleLeft")
        personMap["playerIdleRight"] = SKTexture.init(imageNamed: "personPlayerIdleRight")
    }

    private func loadPortraits() {
        portraitMap[.VendingMachine] = SKTexture(imageNamed: "personLily")
    }

    private func loadTiles() {
        tileMap[.Dirt] = SKTexture(imageNamed: "tileDirt")
        tileMap[.DirtWatered] = SKTexture(imageNamed: "tileDirtWatered")
        tileMap[.DirtTilled] = SKTexture(imageNamed: "tileDirtTilled")
        tileMap[.DirtTilledWatered] = SKTexture(imageNamed: "tileDirtTilledWatered")
        tileMap[.Grass] = SKTexture(imageNamed: "tileGrass")
        tileMap[.Water] = SKTexture(imageNamed: "tileWater")

        tileMap[.Wood] = SKTexture(imageNamed: "tileWood")
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

    func getTexture(cropName: String) -> SKTexture? {
        if cropMap[cropName] == nil {
            print ("[TextureManager] [Desc=No texture] [cropName=\(cropName)]")
        } else {
            return cropMap[cropName]
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

    func getTexture(portraitId: PortraitId) -> SKTexture? {
        if portraitMap[portraitId] == nil {
            print ("[TextureManager] [Desc=No texture] [PortraitId=\(portraitId)]")
        } else {
            return portraitMap[portraitId]
        }
        return nil
    }

    private func postProcess () {
        hudMap.forEach({$0.value.filteringMode = .nearest})

        buildingMap.forEach({$0.value.filteringMode = .nearest})
        itemMap.forEach({$0.value.filteringMode = .nearest})
        tileMap.forEach({$0.value.filteringMode = .nearest})

        personMap.forEach({$0.value.filteringMode = .nearest})
        portraitMap.forEach({$0.value.filteringMode = .nearest})
    }
}
