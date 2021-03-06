import SpriteKit

class TextureManager {
    static let shared = TextureManager()

    private var hudMap = [String: SKTexture]()
    private var buildingMap = [BuildingId: SKTexture]()
    private var cropMap = [String: SKTexture]()
    private var itemMap = [ItemId: SKTexture]()
    private var terrainMap = [TerrainType: SKTexture]()
    private var tileMap = [TileId: SKTexture]()

    private var monsterMap = [String: SKTexture]()
    private var personMap = [String: SKTexture]()
    private var portraitMap = [PortraitId: SKTexture]()

    private init() {
        loadHud()

        loadBuildings()
        loadCrops()
        ItemInfoManager.shared.itemInfos.forEach({itemMap[$0.id] = SKTexture(imageNamed: $0.textureName)})
        TerrainInfoManager.shared.terrainInfos.forEach({terrainMap[$0.type] = SKTexture(imageNamed: $0.textureName)})
        TileInfoManager.shared.tileInfos.forEach({tileMap[$0.id] = SKTexture(imageNamed: $0.textureName)})

        loadMonsters()
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

        hudMap["hudDialogBackground"] = SKTexture(imageNamed: "hudDialogBackground")
    }

    private func loadBuildings() {
        buildingMap[.FarmToHouseDoor] = SKTexture(imageNamed: "buildingDoor")
        buildingMap[.FarmToTownDoor] = SKTexture(imageNamed: "buildingDoor")
        buildingMap[.TownToFarmDoor] = SKTexture(imageNamed: "buildingDoor")
        buildingMap[.TownToGeneralStoreDoor] = SKTexture(imageNamed: "buildingDoor")
        buildingMap[.TownToJamesHouseDoor] = SKTexture(imageNamed: "buildingDoor")

        buildingMap[.FarmHouse] = SKTexture(imageNamed: "buildingFarmHouse")
        buildingMap[.JamesHouse] = SKTexture(imageNamed: "buildingJamesHouse")
        buildingMap[.Wall] = SKTexture(imageNamed: "buildingWall")

        buildingMap[.SingleBed] = SKTexture(imageNamed: "buildingSingleBed")
        buildingMap[.Rock] = SKTexture(imageNamed: "buildingRock")
        buildingMap[.FarmDeliveryBox] = SKTexture(imageNamed: "buildingFarmDeliveryBox")

        buildingMap[.Chair] = SKTexture(imageNamed: "buildingChair")
        buildingMap[.Table] = SKTexture(imageNamed: "buildingTable")
        buildingMap[.TV] = SKTexture(imageNamed: "buildingTv")
        buildingMap[.Easel] = SKTexture(imageNamed: "buildingEasel")
        buildingMap[.Bookshelf] = SKTexture(imageNamed: "buildingBookshelf")
        buildingMap[.Cashier] = SKTexture(imageNamed: "buildingCashier")

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

    func loadMonsters() {
        // Goblin
        monsterMap["monsterGoblinIdleSouth"] = SKTexture.init(imageNamed: "monsterGoblinIdleSouth")
    }


    func loadPeople() {
        // Player
        personMap["playerIdleNorth"] = SKTexture.init(imageNamed: "personPlayerIdleNorth")
        personMap["playerIdleSouth"] = SKTexture.init(imageNamed: "personPlayerIdleSouth")
        personMap["playerIdleWest"] = SKTexture.init(imageNamed: "personPlayerIdleWest")
        personMap["playerIdleEast"] = SKTexture.init(imageNamed: "personPlayerIdleEast")

        personMap["playerWalkNorth1"] = SKTexture.init(imageNamed: "personPlayerWalkNorth1")
        personMap["playerWalkNorth2"] = SKTexture.init(imageNamed: "personPlayerWalkNorth2")

        personMap["playerWalkSouth1"] = SKTexture.init(imageNamed: "personPlayerWalkSouth1")
        personMap["playerWalkSouth2"] = SKTexture.init(imageNamed: "personPlayerWalkSouth2")

        personMap["playerWalkWest1"] = SKTexture.init(imageNamed: "personPlayerWalkWest1")
        personMap["playerWalkWest2"] = SKTexture.init(imageNamed: "personPlayerWalkWest2")

        personMap["playerWalkEast1"] = SKTexture.init(imageNamed: "personPlayerWalkEast1")
        personMap["playerWalkEast2"] = SKTexture.init(imageNamed: "personPlayerWalkEast2")

        // TODO: Finish animations for this
        personMap["playerUseToolUpDownNorth1"] = SKTexture.init(imageNamed: "personPlayerUseToolUpDownNorth1")
        personMap["playerUseToolUpDownNorth2"] = SKTexture.init(imageNamed: "personPlayerUseToolUpDownNorth2")
        personMap["playerUseToolUpDownNorth3"] = SKTexture.init(imageNamed: "personPlayerUseToolUpDownNorth3")

        personMap["playerUseToolUpDownSouth1"] = SKTexture.init(imageNamed: "personPlayerUseToolUpDownSouth1")
        personMap["playerUseToolUpDownSouth2"] = SKTexture.init(imageNamed: "personPlayerUseToolUpDownSouth2")
        personMap["playerUseToolUpDownSouth3"] = SKTexture.init(imageNamed: "personPlayerUseToolUpDownSouth3")

        personMap["playerUseToolUpDownWest1"] = SKTexture.init(imageNamed: "personPlayerUseToolUpDownWest1")
        personMap["playerUseToolUpDownWest2"] = SKTexture.init(imageNamed: "personPlayerUseToolUpDownWest2")
        personMap["playerUseToolUpDownWest3"] = SKTexture.init(imageNamed: "personPlayerUseToolUpDownWest3")

        personMap["playerUseToolUpDownEast1"] = SKTexture.init(imageNamed: "personPlayerUseToolUpDownEast1")
        personMap["playerUseToolUpDownEast2"] = SKTexture.init(imageNamed: "personPlayerUseToolUpDownEast2")
        personMap["playerUseToolUpDownEast3"] = SKTexture.init(imageNamed: "personPlayerUseToolUpDownEast3")

        // Lily
        personMap["lilyIdleNorth"] = SKTexture.init(imageNamed: "personLilyIdleSouth")
        personMap["lilyIdleSouth"] = SKTexture.init(imageNamed: "personLilyIdleSouth")
        personMap["lilyIdleWest"] = SKTexture.init(imageNamed: "personLilyIdleSouth")
        personMap["lilyIdleEast"] = SKTexture.init(imageNamed: "personLilyIdleSouth")

        // James
        personMap["jamesIdleNorth"] = SKTexture.init(imageNamed: "personJamesIdleSouth")
        personMap["jamesIdleSouth"] = SKTexture.init(imageNamed: "personJamesIdleSouth")
        personMap["jamesIdleWest"] = SKTexture.init(imageNamed: "personJamesIdleSouth")
        personMap["jamesIdleEast"] = SKTexture.init(imageNamed: "personJamesIdleSouth")
    }

    private func loadPortraits() {
        portraitMap[.Dummy] = SKTexture(imageNamed: "portraitDummy")
        
        portraitMap[.Lily] = SKTexture(imageNamed: "portraitLily")
        portraitMap[.James] = SKTexture(imageNamed: "portraitDummy")
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

    func getTexture(tileId: TileId) -> SKTexture? {
        if tileMap[tileId] == nil {
            print ("[TextureManager] [Desc=No texture] [TileId=\(tileId)]")
        } else {
            return tileMap[tileId]
        }
        return nil
    }

    func getTexture(monsterTextureName: String) -> SKTexture? {
        if monsterMap[monsterTextureName] == nil {
            print ("[TextureManager] [Desc=No texture] [MonsterTextureName=\(monsterTextureName)]")
        } else {
            return monsterMap[monsterTextureName]
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

        monsterMap.forEach({$0.value.filteringMode = .nearest})
        personMap.forEach({$0.value.filteringMode = .nearest})
        portraitMap.forEach({$0.value.filteringMode = .nearest})
    }
}
