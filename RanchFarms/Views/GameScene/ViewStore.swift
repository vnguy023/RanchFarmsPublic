import SpriteKit

class ViewStore: SKSpriteNode {
    private let world: World
    private let hudInterfaceData: HudInterfaceDataGame
    private let player: Person

    private var store: Store!{
        get {return hudInterfaceData.store}
    }
    private var cursor: CGPoint {
        get {return hudInterfaceData.storeCursor}
    }

    private let blackScreen = SKSpriteNode(color: .black, size: Config.screenSize)

    private let clerkPortrait = SKSpriteNode(color: .systemPink, size: Config.viewStoreClerkSize)
    private let slogan = SKSpriteNode(color: .darkGray, size: Config.viewStoreSloganSize)
    private let sloganText = SKLabelNode(fontNamed: "ChalkDuster")

    private let topLeftItemInfoPosition = CGPoint(x: Config.viewInventoryColumns * Config.itemImageSize.width / -2 + 50,
                                                  y: 0)
    private let itemInfoPortrait = ViewItemButton(item: nil)
    private let itemInfoDescription = SKSpriteNode(color: .darkGray,
                                                   size: CGSize(width: Config.viewInventoryColumns * Config.itemImageSize.width - Config.viewStoreItemInfoPortraitSize.width,
                                                                height: Config.viewStoreItemInfoPortraitSize.height))
    private let itemInfoDescriptionText = SKLabelNode(fontNamed: "ChalkDuster")
    private let itemInfoBuySellPrice = SKLabelNode(fontNamed: "ChalkDuster")

    private let topLeftPlayerItemPosition = CGPoint(x: Config.viewInventoryColumns * Config.itemImageSize.width / -2 + 50,
                                                    y: -200)
    private var playerItems = [ViewItemButton]()

    private let topLeftStoreItemPosition = CGPoint(x: Config.viewStoreItemColumns * Config.itemImageSize.width / -2 + 50,
                                                   y: 200)
    private var storeItems = [ViewItemButton]()

    init(world: World, hudInterfaceData: HudInterfaceDataGame) {
        self.world = world
        self.hudInterfaceData = hudInterfaceData
        self.player = world.player

        super.init(texture: nil, color: .clear, size: Config.viewStoreSize)

        blackScreen.alpha = 0.5
        blackScreen.zPosition = -10
        self.addChild(blackScreen)

        clerkPortrait.position = CGPoint( x: self.size.width / -2 + clerkPortrait.size.width / 2,
                                          y: clerkPortrait.size.height)
        self.addChild(clerkPortrait)

        slogan.position = CGPoint( x: clerkPortrait.position.x,
                                   y: clerkPortrait.position.y - clerkPortrait.size.height/2 - slogan.size.height/2)
        self.addChild(slogan)

        sloganText.horizontalAlignmentMode = .center
        sloganText.verticalAlignmentMode = .center
        sloganText.fontSize = 20
        sloganText.fontColor = .white
        sloganText.zPosition = 100
        slogan.addChild(sloganText)

        itemInfoPortrait.size = Config.viewStoreItemInfoPortraitSize
        itemInfoPortrait.zPosition = 100
        itemInfoPortrait.position = topLeftItemInfoPosition
        itemInfoPortrait.position.x += itemInfoPortrait.size.width/2
        itemInfoPortrait.position.y -= itemInfoPortrait.size.height/2
        self.addChild(itemInfoPortrait)

        itemInfoDescription.position = CGPoint( x: itemInfoPortrait.position.x + itemInfoPortrait.size.width/2 + itemInfoDescription.size.width/2,
                                                y: itemInfoPortrait.position.y)
        self.addChild(itemInfoDescription)

        itemInfoDescriptionText.horizontalAlignmentMode = .center
        itemInfoDescriptionText.verticalAlignmentMode = .center
        itemInfoDescriptionText.fontSize = 20
        itemInfoDescriptionText.fontColor = .black
        itemInfoDescriptionText.zPosition = 100
        itemInfoDescription.addChild(itemInfoDescriptionText)

        itemInfoBuySellPrice.horizontalAlignmentMode = .right
        itemInfoBuySellPrice.verticalAlignmentMode = .top
        itemInfoBuySellPrice.fontSize = 20
        itemInfoBuySellPrice.fontColor = .black
        itemInfoBuySellPrice.zPosition = 100
        itemInfoBuySellPrice.position = CGPoint(x: itemInfoDescription.position.x + itemInfoDescription.size.width/2 - 10,
                                                y: itemInfoDescription.position.y + itemInfoDescription.size.height/2 - 10)
        self.addChild(itemInfoBuySellPrice)
    }

    func update() {
        if store == nil {
            print ("[ViewStore] [Desc=attempting to update without valid object]")
            return
        }

        clerkPortrait.texture = TextureManager.shared.getTexture(portraitId: store.storeFront.portraitId)
        sloganText.text = store.storeFront.slogan

        updatePlayerItems()
        updateStoreItems()

        if let playerItemIndex = hudInterfaceData.getStorePlayerItemIndex()
            , let item = world.player.inventory.items[playerItemIndex] {
            itemInfoPortrait.setItem(item: item)
            itemInfoDescriptionText.text = item.itemInfo.name
            if item.itemInfo.canSell {
                itemInfoBuySellPrice.text = "Sell: \(item.itemInfo.sellPrice * item.quantity)(\(item.itemInfo.sellPrice) each)"
            } else {
                itemInfoBuySellPrice.text = "Can't Sell"
            }
        } else if let storeItemIndex = hudInterfaceData.getStoreStoreItemIndex()
            , let item = store.items[storeItemIndex] {
            itemInfoPortrait.setItem(item: item)
            itemInfoDescriptionText.text = item.itemInfo.name
            itemInfoBuySellPrice.text = "Buy: \(item.itemInfo.purchasePrice)"
        } else {
            itemInfoPortrait.setItem(item: nil)
            itemInfoDescriptionText.text = ""
            itemInfoBuySellPrice.text = ""
        }
    }

    private func updatePlayerItems() {
        playerItems.forEach({$0.removeFromParent()})
        playerItems.removeAll()

        var index = 0
        for y in 0 ..< Int(Config.viewInventoryRows) {
            for x in 0 ..< Int(Config.viewInventoryColumns) {
                let itemButton = ViewItemButton(item: player.inventory.items[index])
                itemButton.zPosition = 100
                itemButton.position = topLeftPlayerItemPosition
                itemButton.position.x += (CGFloat(x) * Config.itemImageSize.width) + Config.itemImageSize.width/2
                itemButton.position.y -= (CGFloat(y) * Config.itemImageSize.height) - Config.itemImageSize.height/2
                self.addChild(itemButton)

                if let itemIndex = hudInterfaceData.getStorePlayerItemIndex(), itemIndex == index {
                    itemButton.state = .Highlight
                }

                playerItems.append(itemButton)
                index += 1
            }
        }
    }

    private func updateStoreItems() {
        storeItems.forEach({$0.removeFromParent()})
        storeItems.removeAll()

        var index = 0
        for y in 0 ..< Int(Config.viewStoreItemRows) {
            for x in 0 ..< Int(Config.viewStoreItemColumns) {
                let itemButton = ViewItemButton(item: store.items[index])
                itemButton.zPosition = 100
                itemButton.position = topLeftStoreItemPosition
                itemButton.position.x += (CGFloat(x) * Config.itemImageSize.width) + Config.itemImageSize.width/2
                itemButton.position.y -= (CGFloat(y) * Config.itemImageSize.height) - Config.itemImageSize.height/2
                self.addChild(itemButton)

                if let itemIndex = hudInterfaceData.getStoreStoreItemIndex(), itemIndex == index {
                    itemButton.state = .Highlight
                }

                storeItems.append(itemButton)
                index += 1
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
