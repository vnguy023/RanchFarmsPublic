import SpriteKit

class AnimationManager {
    static let shared = AnimationManager()

    private var playerAnimations = [Person.State: [CGVector: Animation]]()
    private var lilyAnimations = [Person.State: [CGVector: Animation]]()
    private var jamesAnimations = [Person.State: [CGVector: Animation]]()

    private var monsterAnimations = [PersonId: [Person.State: [CGVector: Animation]]]()

    private var buildingAnimations = [BuildingId: Animation]()

    private init() {
        loadBuildingAnimations()
        loadCropAnimations()

        loadPlayerAnimations()
        loadLilyAnimations()
        loadJamesAnimations()

        loadMonsterAnimations()
    }

    private func loadBuildingAnimations() {
        buildingAnimations[.SingleBed] = Animation()
        buildingAnimations[.SingleBed]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .SingleBed),
                                                                duration: 1,
                                                                imageSize: CGSize(width: 1, height: 2),
                                                                anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/4.0)))

        buildingAnimations[.FarmToHouseDoor] = Animation()
        buildingAnimations[.FarmToHouseDoor]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .FarmToHouseDoor),
                                                                      duration: 1,
                                                                      imageSize: CGSize(width: 1, height: 2),
                                                                      anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/4.0)))

        buildingAnimations[.FarmToTownDoor] = Animation()
        buildingAnimations[.FarmToTownDoor]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .FarmToTownDoor),
                                                                     duration: 1,
                                                                     imageSize: CGSize(width: 1, height: 2),
                                                                     anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/4.0)))

        buildingAnimations[.TownToFarmDoor] = Animation()
        buildingAnimations[.TownToFarmDoor]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .TownToFarmDoor),
                                                                     duration: 1,
                                                                     imageSize: CGSize(width: 1, height: 2),
                                                                     anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/4.0)))
        buildingAnimations[.TownToGeneralStoreDoor] = Animation()
        buildingAnimations[.TownToGeneralStoreDoor]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .TownToGeneralStoreDoor),
                                                                             duration: 1,
                                                                             imageSize: CGSize(width: 1, height: 2),
                                                                             anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/4.0)))
        buildingAnimations[.TownToJamesHouseDoor] = Animation()
        buildingAnimations[.TownToJamesHouseDoor]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .TownToJamesHouseDoor),
                                                                             duration: 1,
                                                                             imageSize: CGSize(width: 1, height: 2),
                                                                             anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/4.0)))

        buildingAnimations[.TV] = Animation()
        buildingAnimations[.TV]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .TV),
                                                         duration: 1,
                                                         imageSize: CGSize(width: 2, height: 3),
                                                         anchorPoint: CGPoint(x:1.0/4.0, y: 1.0/6.0)))
        buildingAnimations[.Easel] = Animation()
        buildingAnimations[.Easel]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .Easel),
                                                            duration: 1,
                                                            imageSize: CGSize(width: 1, height: 2),
                                                            anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/4.0)))
        buildingAnimations[.Bookshelf] = Animation()
        buildingAnimations[.Bookshelf]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .Bookshelf),
                                                                duration: 1,
                                                                imageSize: CGSize(width: 1, height: 2),
                                                                anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/4.0)))
        buildingAnimations[.Cashier] = Animation()
        buildingAnimations[.Cashier]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .Cashier),
                                                              duration: 1,
                                                              imageSize: CGSize(width: 1, height: 2),
                                                              anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/4.0)))

        buildingAnimations[.SingleBed] = Animation()
        buildingAnimations[.SingleBed]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .SingleBed),
                                                                duration: 1,
                                                                imageSize: CGSize(width: 2, height: 2),
                                                                anchorPoint: CGPoint(x:1.0/4.0, y: 1.0/4.0)))

        buildingAnimations[.FarmDeliveryBox] = Animation()
        buildingAnimations[.FarmDeliveryBox]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .FarmDeliveryBox),
                                                                duration: 1,
                                                                imageSize: CGSize(width: 2, height: 1.5),
                                                                anchorPoint: CGPoint(x:1.0/4.0, y: 1.0/3.0)))

        buildingAnimations[.Chair] = Animation()
        buildingAnimations[.Chair]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .Chair),
                                                            duration: 1,
                                                            imageSize: CGSize(width: 1, height: 1.5),
                                                            anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/3.0)))
        buildingAnimations[.Table] = Animation()
        buildingAnimations[.Table]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .Table),
                                                            duration: 1,
                                                            imageSize: CGSize(width: 2, height: 2),
                                                            anchorPoint: CGPoint(x:1.0/4.0, y: 1.0/4.0)))
        buildingAnimations[.FarmHouse] = Animation()
        buildingAnimations[.FarmHouse]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .FarmHouse),
                                                                duration: 1,
                                                                imageSize: CGSize(width: 5, height: 5),
                                                                anchorPoint: CGPoint(x:1.0/10.0, y: 1.0/10.0)))
        buildingAnimations[.JamesHouse] = Animation()
        buildingAnimations[.JamesHouse]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .JamesHouse),
                                                                duration: 1,
                                                                imageSize: CGSize(width: 5, height: 5),
                                                                anchorPoint: CGPoint(x:1.0/10.0, y: 1.0/10.0)))
        buildingAnimations[.Wall] = Animation()
        buildingAnimations[.Wall]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .Wall),
                                                            duration: 1,
                                                            imageSize: CGSize(width: 1, height: 2),
                                                            anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/4.0)))


        buildingAnimations[.PlayerHouseSign] = Animation()
        buildingAnimations[.PlayerHouseSign]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .PlayerHouseSign),
                                                                      duration: 1,
                                                                      imageSize: CGSize(width: 1, height: 2),
                                                                      anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/4.0)))
    }

    private func loadCropAnimations() {
        buildingAnimations[.Garlic] = Animation()
        buildingAnimations[.Garlic]!.repeats = false
        buildingAnimations[.Garlic]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(cropName: "garlic1"),
                                                             duration: 1,
                                                             imageSize: CGSize(width: 1, height: 1),
                                                             anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/2.0)))
        buildingAnimations[.Garlic]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(cropName: "garlic2"),
                                                             duration: 1,
                                                             imageSize: CGSize(width: 1, height: 1),
                                                             anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/2.0)))
        buildingAnimations[.Garlic]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(cropName: "garlic3"),
                                                             duration: 2,
                                                             imageSize: CGSize(width: 1, height: 1),
                                                             anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/2.0)))
        buildingAnimations[.Garlic]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(cropName: "garlic4"),
                                                             duration: 2,
                                                             imageSize: CGSize(width: 1, height: 1),
                                                             anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/2.0)))
        buildingAnimations[.Garlic]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(cropName: "garlic5"),
                                                             duration: 2,
                                                             imageSize: CGSize(width: 1, height: 1),
                                                             anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/2.0)))
        buildingAnimations[.Garlic]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(cropName: "garlic6"),
                                                             duration: 1,
                                                             imageSize: CGSize(width: 1, height: 1),
                                                             anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/2.0)))

        buildingAnimations[.Turnip] = Animation()
        buildingAnimations[.Turnip]!.repeats = false
        buildingAnimations[.Turnip]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(cropName: "turnip1"),
                                                             duration: 1,
                                                             imageSize: CGSize(width: 1, height: 1),
                                                             anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/2.0)))
        buildingAnimations[.Turnip]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(cropName: "turnip2"),
                                                             duration: 1,
                                                             imageSize: CGSize(width: 1, height: 1),
                                                             anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/2.0)))
        buildingAnimations[.Turnip]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(cropName: "turnip3"),
                                                             duration: 1,
                                                             imageSize: CGSize(width: 1, height: 1),
                                                             anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/2.0)))
        buildingAnimations[.Turnip]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(cropName: "turnip4"),
                                                             duration: 1,
                                                             imageSize: CGSize(width: 1, height: 1),
                                                             anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/2.0)))
        buildingAnimations[.Turnip]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(cropName: "turnip5"),
                                                             duration: 1,
                                                             imageSize: CGSize(width: 1, height: 1),
                                                             anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/2.0)))
    }

    private func loadPlayerAnimations() {
        let anchorPoint = CGPoint(x: 0.5, y: 1.0/3.0)

        ////////////////////////////////
        // Idle Animations
        var idleAnimations = [CGVector: Animation]()
        idleAnimations[.NORTH] = Animation()
        idleAnimations[.NORTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleNorth"),
                                                        duration: 1,
                                                        imageSize: CGSize(width: 1, height: 1.5),
                                                        anchorPoint: anchorPoint))

        idleAnimations[.SOUTH] = Animation()
        idleAnimations[.SOUTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleSouth"),
                                                        duration: 1,
                                                        imageSize: CGSize(width: 1, height: 1.5),
                                                        anchorPoint: anchorPoint))

        idleAnimations[.WEST] = Animation()
        idleAnimations[.WEST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleWest"),
                                                        duration: 1,
                                                        imageSize: CGSize(width: 1, height: 1.5),
                                                        anchorPoint: anchorPoint))

        idleAnimations[.EAST] = Animation()
        idleAnimations[.EAST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleEast"),
                                                        duration: 1,
                                                        imageSize: CGSize(width: 1, height: 1.5),
                                                        anchorPoint: anchorPoint))

        playerAnimations[Person.State.Idle] = idleAnimations

        ////////////////////////////////
        // Walking Animations
        var walkingAnimations = [CGVector: Animation]()
        walkingAnimations[.NORTH] = Animation()
        walkingAnimations[.NORTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerWalkNorth1"),
                                                        duration: 8,
                                                        imageSize: CGSize(width: 1, height: 1.5),
                                                        anchorPoint: anchorPoint))
        walkingAnimations[.NORTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleNorth"),
                                                           duration: 8,
                                                           imageSize: CGSize(width: 1, height: 1.5),
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.NORTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerWalkNorth2"),
                                                           duration: 8,
                                                           imageSize: CGSize(width: 1, height: 1.5),
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.NORTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleNorth"),
                                                           duration: 8,
                                                           imageSize: CGSize(width: 1, height: 1.5),
                                                           anchorPoint: anchorPoint))

        walkingAnimations[.SOUTH] = Animation()
        walkingAnimations[.SOUTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerWalkSouth1"),
                                                           duration: 8,
                                                           imageSize: CGSize(width: 1, height: 1.5),
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.SOUTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleSouth"),
                                                           duration: 8,
                                                           imageSize: CGSize(width: 1, height: 1.5),
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.SOUTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerWalkSouth2"),
                                                           duration: 8,
                                                           imageSize: CGSize(width: 1, height: 1.5),
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.SOUTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleSouth"),
                                                           duration: 8,
                                                           imageSize: CGSize(width: 1, height: 1.5),
                                                           anchorPoint: anchorPoint))

        walkingAnimations[.WEST] = Animation()
        walkingAnimations[.WEST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerWalkWest1"),
                                                           duration: 8,
                                                           imageSize: CGSize(width: 1, height: 1.5),
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.WEST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleWest"),
                                                           duration: 8,
                                                           imageSize: CGSize(width: 1, height: 1.5),
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.WEST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerWalkWest2"),
                                                           duration: 8,
                                                           imageSize: CGSize(width: 1, height: 1.5),
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.WEST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleWest"),
                                                           duration: 8,
                                                           imageSize: CGSize(width: 1, height: 1.5),
                                                           anchorPoint: anchorPoint))

        walkingAnimations[.EAST] = Animation()
        walkingAnimations[.EAST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerWalkEast1"),
                                                           duration: 8,
                                                           imageSize: CGSize(width: 1, height: 1.5),
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.EAST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleEast"),
                                                           duration: 8,
                                                           imageSize: CGSize(width: 1, height: 1.5),
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.EAST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerWalkEast2"),
                                                           duration: 8,
                                                           imageSize: CGSize(width: 1, height: 1.5),
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.EAST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleEast"),
                                                           duration: 8,
                                                           imageSize: CGSize(width: 1, height: 1.5),
                                                           anchorPoint: anchorPoint))

        playerAnimations[Person.State.Walking] = walkingAnimations

        ////////////////////////////////
        // Use Tool(Up/Down) Animations
        var useToolUpDownAnimations = [CGVector: Animation]()
        useToolUpDownAnimations[.NORTH] = Animation()
        useToolUpDownAnimations[.NORTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerUseToolUpDownNorth1"),
                                                                 duration: 8,
                                                                 imageSize: CGSize(width: 1, height: 1.5),
                                                                 anchorPoint: anchorPoint))
        useToolUpDownAnimations[.NORTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerUseToolUpDownNorth2"),
                                                                 duration: 6,
                                                                 imageSize: CGSize(width: 1, height: 1.5),
                                                                 anchorPoint: anchorPoint))
        useToolUpDownAnimations[.NORTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerUseToolUpDownNorth3"),
                                                                 duration: 6,
                                                                 imageSize: CGSize(width: 1, height: 1.5),
                                                                 anchorPoint: anchorPoint))
        

        useToolUpDownAnimations[.SOUTH] = Animation()
        useToolUpDownAnimations[.SOUTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerUseToolUpDownSouth1"),
                                                                 duration: 8,
                                                                 imageSize: CGSize(width: 1, height: 1.5),
                                                                 anchorPoint: anchorPoint))
        useToolUpDownAnimations[.SOUTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerUseToolUpDownSouth2"),
                                                                 duration: 6,
                                                                 imageSize: CGSize(width: 1, height: 1.5),
                                                                 anchorPoint: anchorPoint))
        useToolUpDownAnimations[.SOUTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerUseToolUpDownSouth3"),
                                                                 duration: 6,
                                                                 imageSize: CGSize(width: 1, height: 1.5),
                                                                 anchorPoint: anchorPoint))

        useToolUpDownAnimations[.WEST] = Animation()
        useToolUpDownAnimations[.WEST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerUseToolUpDownWest1"),
                                                                duration: 8,
                                                                imageSize: CGSize(width: 1, height: 1.5),
                                                                anchorPoint: anchorPoint))
        useToolUpDownAnimations[.WEST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerUseToolUpDownWest2"),
                                                                duration: 6,
                                                                imageSize: CGSize(width: 1, height: 1.5),
                                                                anchorPoint: anchorPoint))
        useToolUpDownAnimations[.WEST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerUseToolUpDownWest3"),
                                                                duration: 6,
                                                                imageSize: CGSize(width: 1, height: 1.5),
                                                                anchorPoint: anchorPoint))

        useToolUpDownAnimations[.EAST] = Animation()
        useToolUpDownAnimations[.EAST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerUseToolUpDownEast1"),
                                                                duration: 8,
                                                                imageSize: CGSize(width: 1, height: 1.5),
                                                                anchorPoint: anchorPoint))
        useToolUpDownAnimations[.EAST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerUseToolUpDownEast2"),
                                                                duration: 6,
                                                                imageSize: CGSize(width: 1, height: 1.5),
                                                                anchorPoint: anchorPoint))
        useToolUpDownAnimations[.EAST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerUseToolUpDownEast3"),
                                                                duration: 6,
                                                                imageSize: CGSize(width: 1, height: 1.5),
                                                                anchorPoint: anchorPoint))

        playerAnimations[Person.State.Axeing] = useToolUpDownAnimations
        playerAnimations[Person.State.Hoeing] = useToolUpDownAnimations
        playerAnimations[Person.State.Mining] = useToolUpDownAnimations
        playerAnimations[Person.State.Watering] = useToolUpDownAnimations

        var attackAnimations = [CGVector: Animation]()
        attackAnimations[.NORTH] = Animation()

        attackAnimations[.NORTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleNorth"),
                                                          duration: 6,
                                                          imageSize: CGSize(width: 1, height: 1.5),
                                                          anchorPoint: anchorPoint))

        attackAnimations[.SOUTH] = Animation()
        attackAnimations[.SOUTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleSouth"),
                                                          duration: 6,
                                                          imageSize: CGSize(width: 1, height: 1.5),
                                                          anchorPoint: anchorPoint))

        attackAnimations[.WEST] = Animation()
        attackAnimations[.WEST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleWest"),
                                                          duration: 6,
                                                          imageSize: CGSize(width: 1, height: 1.5),
                                                          anchorPoint: anchorPoint))

        attackAnimations[.EAST] = Animation()
        attackAnimations[.EAST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleEast"),
                                                          duration: 6,
                                                          imageSize: CGSize(width: 1, height: 1.5),
                                                          anchorPoint: anchorPoint))
        playerAnimations[Person.State.Attacking] = attackAnimations
    }

    private func loadLilyAnimations() {
        let anchorPoint = CGPoint(x: 0.5, y: 1.0/3.0)

        ////////////////////////////////
        // Idle Animations
        var idleAnimations = [CGVector: Animation]()
        idleAnimations[.NORTH] = Animation()
        idleAnimations[.NORTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "lilyIdleNorth"),
                                                        duration: 1,
                                                        imageSize: CGSize(width: 1, height: 1.5),
                                                        anchorPoint: anchorPoint))

        idleAnimations[.SOUTH] = Animation()
        idleAnimations[.SOUTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "lilyIdleSouth"),
                                                        duration: 1,
                                                        imageSize: CGSize(width: 1, height: 1.5),
                                                        anchorPoint: anchorPoint))

        idleAnimations[.WEST] = Animation()
        idleAnimations[.WEST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "lilyIdleWest"),
                                                        duration: 1,
                                                        imageSize: CGSize(width: 1, height: 1.5),
                                                        anchorPoint: anchorPoint))

        idleAnimations[.EAST] = Animation()
        idleAnimations[.EAST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "lilyIdleEast"),
                                                        duration: 1,
                                                        imageSize: CGSize(width: 1, height: 1.5),
                                                        anchorPoint: anchorPoint))

        lilyAnimations[Person.State.Idle] = idleAnimations
    }

    private func loadJamesAnimations() {
        let anchorPoint = CGPoint(x: 0.5, y: 1.0/4.0)

        ////////////////////////////////
        // Idle Animations
        var idleAnimations = [CGVector: Animation]()
        idleAnimations[.NORTH] = Animation()
        idleAnimations[.NORTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "jamesIdleNorth"),
                                                        duration: 1,
                                                        imageSize: CGSize(width: 1, height: 2),
                                                        anchorPoint: anchorPoint))

        idleAnimations[.SOUTH] = Animation()
        idleAnimations[.SOUTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "jamesIdleSouth"),
                                                        duration: 1,
                                                        imageSize: CGSize(width: 1, height: 2),
                                                        anchorPoint: anchorPoint))

        idleAnimations[.WEST] = Animation()
        idleAnimations[.WEST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "jamesIdleWest"),
                                                        duration: 1,
                                                        imageSize: CGSize(width: 1, height: 2),
                                                        anchorPoint: anchorPoint))

        idleAnimations[.EAST] = Animation()
        idleAnimations[.EAST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "jamesIdleEast"),
                                                        duration: 1,
                                                        imageSize: CGSize(width: 1, height: 2),
                                                        anchorPoint: anchorPoint))

        jamesAnimations[Person.State.Idle] = idleAnimations
    }

    private func loadMonsterAnimations() {
        monsterAnimations[.Goblin] = [Person.State: [CGVector: Animation]]()

        let anchorPoint = CGPoint(x: 0.5, y: 1.0/4.0)

        ////////////////////////////////
        // Idle Animations
        var idleAnimations = [CGVector: Animation]()
        idleAnimations[.NORTH] = Animation()
        idleAnimations[.NORTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(monsterTextureName: "monsterGoblinIdleSouth"),
                                                        duration: 1,
                                                        imageSize: CGSize(width: 1, height: 2),
                                                        anchorPoint: anchorPoint))

        idleAnimations[.SOUTH] = Animation()
        idleAnimations[.SOUTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(monsterTextureName: "monsterGoblinIdleSouth"),
                                                        duration: 1,
                                                        imageSize: CGSize(width: 1, height: 2),
                                                        anchorPoint: anchorPoint))

        idleAnimations[.WEST] = Animation()
        idleAnimations[.WEST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(monsterTextureName: "monsterGoblinIdleSouth"),
                                                        duration: 1,
                                                        imageSize: CGSize(width: 1, height: 2),
                                                        anchorPoint: anchorPoint))

        idleAnimations[.EAST] = Animation()
        idleAnimations[.EAST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(monsterTextureName: "monsterGoblinIdleSouth"),
                                                        duration: 1,
                                                        imageSize: CGSize(width: 1, height: 2),
                                                        anchorPoint: anchorPoint))

        self.monsterAnimations[.Goblin]![Person.State.Idle] = idleAnimations
    }

    func getAnimation(person: Person) -> Animation? {
        var animations: [Person.State: [CGVector: Animation]]! = nil
        switch person.id {
        case .Player:
            animations = playerAnimations
        case .Lily:
            animations = lilyAnimations
        case .James:
            animations = jamesAnimations
        case .Goblin:
            animations = monsterAnimations[.Goblin]
        default: break
        }

        if animations != nil, let stateAnimations = animations[person.state] {
            if let result = stateAnimations[person.faceDirection] {
                return result
            } else {
                 return stateAnimations[CGVector.NORTH]
            }
        }

        print ("[AnimationManager] [Desc=Unable to find animation for Person] [PersonId=\(person.id)]")
        return nil
    }

    func getAnimation(building: Building) -> Animation? {
        if let result = buildingAnimations[building.id] {
            return result
        }

        print ("[AnimationManager] [Desc=Unable to find animation for Building] [BuildingId=\(building.id)]")
        return nil
    }
}
