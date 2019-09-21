import SpriteKit

class TextureManager {
    static let shared = TextureManager()

    private var hudMap = [String: SKTexture]()
    private var buildingMap = [BuildingId: SKTexture]()
    private var cropMap = [String: SKTexture]()
    private var itemMap = [ItemId: SKTexture]()
    private var terrainMap = [TerrainType: SKTexture]()
    private var tileMap = [TileType: SKTexture]()

    private var personMap = [String: SKTexture]()
    private var portraitMap = [PortraitId: SKTexture]()

    private init() {
        loadHud()

        loadBuildings()
        loadCrops()
        loadItems()
        loadTerrains()
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
        hudMap["hudTrashCan"] = SKTexture(imageNamed: "hudTrashCan")
    }

    private func loadBuildings() {
        buildingMap[.HouseToFarmDoor] = SKTexture(imageNamed: "buildingDoor")
        buildingMap[.FarmToHouseDoor] = SKTexture(imageNamed: "buildingDoor")
        buildingMap[.FarmToTownDoor] = SKTexture(imageNamed: "buildingDoor")
        buildingMap[.TownToFarmDoor] = SKTexture(imageNamed: "buildingDoor")
        buildingMap[.TownToGeneralStoreDoor] = SKTexture(imageNamed: "buildingDoor")
        buildingMap[.GeneralStoreToTownDoor] = SKTexture(imageNamed: "buildingDoor")

        buildingMap[.FarmHouse] = SKTexture(imageNamed: "buildingFarmHouse")
        buildingMap[.Wall] = SKTexture(imageNamed: "buildingWall")

        buildingMap[.SingleBed] = SKTexture(imageNamed: "buildingSingleBed")
        buildingMap[.Rock] = SKTexture(imageNamed: "buildingRock")
        buildingMap[.FarmDeliveryBox] = SKTexture(imageNamed: "buildingFarmDeliveryBox")

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

        cropMap["turnip1"] = SKTexture(imageNamed: "buildingTurnip1")
        cropMap["turnip2"] = SKTexture(imageNamed: "buildingTurnip2")
        cropMap["turnip3"] = SKTexture(imageNamed: "buildingTurnip3")
        cropMap["turnip4"] = SKTexture(imageNamed: "buildingTurnip4")
        cropMap["turnip5"] = SKTexture(imageNamed: "buildingTurnip5")

    }

    private func loadItems() {
        itemMap[.Axe] = SKTexture(imageNamed: "itemAxe")
        itemMap[.Hoe] = SKTexture(imageNamed: "itemHoe")
        itemMap[.PickAxe] = SKTexture(imageNamed: "itemPickAxe")
        itemMap[.WaterCan] = SKTexture(imageNamed: "itemWatercan")

        // Crops
        itemMap[.GarlicSeed] = SKTexture(imageNamed: "itemGarlicSeed")
        itemMap[.Garlic] = SKTexture(imageNamed: "itemGarlic")
        itemMap[.TurnipSeed] = SKTexture(imageNamed: "itemTurnipSeed")
        itemMap[.Turnip] = SKTexture(imageNamed: "itemTurnip")
    }

    func loadPeople() {
        personMap["playerIdleUp"] = SKTexture.init(imageNamed: "personPlayerIdleUp")
        personMap["playerIdleDown"] = SKTexture.init(imageNamed: "personPlayerIdleDown")
        personMap["playerIdleLeft"] = SKTexture.init(imageNamed: "personPlayerIdleLeft")
        personMap["playerIdleRight"] = SKTexture.init(imageNamed: "personPlayerIdleRight")

        personMap["playerWalkUp1"] = SKTexture.init(imageNamed: "personPlayerWalkUp1")
        personMap["playerWalkUp2"] = SKTexture.init(imageNamed: "personPlayerWalkUp2")

        personMap["playerWalkDown1"] = SKTexture.init(imageNamed: "personPlayerWalkDown1")
        personMap["playerWalkDown2"] = SKTexture.init(imageNamed: "personPlayerWalkDown2")

        personMap["playerWalkLeft1"] = SKTexture.init(imageNamed: "personPlayerWalkLeft1")
        personMap["playerWalkLeft2"] = SKTexture.init(imageNamed: "personPlayerWalkLeft2")

        personMap["playerWalkRight1"] = SKTexture.init(imageNamed: "personPlayerWalkRight1")
        personMap["playerWalkRight2"] = SKTexture.init(imageNamed: "personPlayerWalkRight2")

        // TODO: Finish animations for this
        personMap["playerUseToolUpDownNorth1"] = SKTexture.init(imageNamed: "personPlayerUseToolUpDownSouth1")
        personMap["playerUseToolUpDownNorth2"] = SKTexture.init(imageNamed: "personPlayerUseToolUpDownSouth2")
        personMap["playerUseToolUpDownNorth3"] = SKTexture.init(imageNamed: "personPlayerUseToolUpDownSouth3")

        personMap["playerUseToolUpDownSouth1"] = SKTexture.init(imageNamed: "personPlayerUseToolUpDownSouth1")
        personMap["playerUseToolUpDownSouth2"] = SKTexture.init(imageNamed: "personPlayerUseToolUpDownSouth2")
        personMap["playerUseToolUpDownSouth3"] = SKTexture.init(imageNamed: "personPlayerUseToolUpDownSouth3")

        personMap["playerUseToolUpDownWest1"] = SKTexture.init(imageNamed: "personPlayerUseToolUpDownSouth1")
        personMap["playerUseToolUpDownWest2"] = SKTexture.init(imageNamed: "personPlayerUseToolUpDownSouth2")
        personMap["playerUseToolUpDownWest3"] = SKTexture.init(imageNamed: "personPlayerUseToolUpDownSouth3")

        personMap["playerUseToolUpDownEast1"] = SKTexture.init(imageNamed: "personPlayerUseToolUpDownSouth1")
        personMap["playerUseToolUpDownEast2"] = SKTexture.init(imageNamed: "personPlayerUseToolUpDownSouth2")
        personMap["playerUseToolUpDownEast3"] = SKTexture.init(imageNamed: "personPlayerUseToolUpDownSouth3")

    }

    private func loadPortraits() {
        portraitMap[.VendingMachine] = SKTexture(imageNamed: "personLily")
    }

    private func loadTerrains() {
        terrainMap[.Tilled] = SKTexture(imageNamed: "terrainTilled")
        terrainMap[.Watered] = SKTexture(imageNamed: "terrainWatered")
        terrainMap[.TilledWatered] = SKTexture(imageNamed: "terrainTilledWatered")

        terrainMap[.Wood] = SKTexture(imageNamed: "terrainWood")
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

    func getTexture(terrainType: TerrainType) -> SKTexture? {
        if terrainMap[terrainType] == nil {
            print ("[TextureManager] [Desc=No texture] [TerrainType=\(terrainType)]")
        } else {
            return terrainMap[terrainType]
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
        cropMap.forEach({$0.value.filteringMode = .nearest})
        itemMap.forEach({$0.value.filteringMode = .nearest})
        terrainMap.forEach({$0.value.filteringMode = .nearest})
        tileMap.forEach({$0.value.filteringMode = .nearest})

        personMap.forEach({$0.value.filteringMode = .nearest})
        portraitMap.forEach({$0.value.filteringMode = .nearest})
    }
}
