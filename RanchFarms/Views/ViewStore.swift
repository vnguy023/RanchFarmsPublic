import SpriteKit

class ViewStore: SKSpriteNode {
    private let world: World
    private let player: Person

    private var store: Store!{
        get {return world.hudInterfaceData.store}
    }
    private var cursor: CGPoint {
        get {return world.hudInterfaceData.storeCursor}
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

    private let topLeftPlayerItemPosition = CGPoint(x: Config.viewInventoryColumns * Config.itemImageSize.width / -2 + 50,
                                                    y: -200)
    private var playerItems = [ViewItemButton]()

    private let topLeftStoreItemPosition = CGPoint(x: Config.viewStoreItemColumns * Config.itemImageSize.width / -2 + 50,
                                                   y: 200)
    private var storeItems = [ViewItemButton]()

    init(world: World) {
        self.world = world
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

        update()
    }

    func update() {
        if store == nil {
            print ("[Desc=ViewStore] [attempting to update the store without a valid store object being set]")
            return
        }

        clerkPortrait.texture = TextureManager.shared.getTexture(portraitId: store.storeFront.portraitId)
        sloganText.text = store.storeFront.slogan

        // these values need to be replaced
        itemInfoDescriptionText.text = "Garlic: Delicious~"

        updatePlayerItems()
        updateStoreItems()
    }

    func updatePlayerItems() {
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

                if let itemIndex = world.hudInterfaceData.getStorePlayerItemIndex(), itemIndex == index {
                    itemButton.state = .Highlight
                }

                playerItems.append(itemButton)
                index += 1
            }
        }
    }

    func updateStoreItems() {
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

                if let itemIndex = world.hudInterfaceData.getStoreStoreItemIndex(), itemIndex == index {
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
