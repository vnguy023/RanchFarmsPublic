import SpriteKit

class AnimationManager {
    static let shared = AnimationManager()

    private var playerAnimations = [Person.State: [CGVector: Animation]]()

    private var buildingAnimations = [BuildingId: Animation]()

    private init() {
        loadBuildingAnimations()
        loadCropAnimations()
        loadPlayerAnimations()
    }

    private func loadBuildingAnimations() {
        let stdImgSize = Config.tileSize

        buildingAnimations[.SingleBed] = Animation()
        buildingAnimations[.SingleBed]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .SingleBed),
                                                                duration: 1,
                                                                imageSize: CGSize(width: stdImgSize.width, height: stdImgSize.height*2),
                                                                anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/4.0)))

        buildingAnimations[.Door] = Animation()
        buildingAnimations[.Door]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .Door),
                                                           duration: 1,
                                                           imageSize: CGSize(width: stdImgSize.width, height: stdImgSize.height*2),
                                                           anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/4.0)))

        buildingAnimations[.TV] = Animation()
        buildingAnimations[.TV]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .TV),
                                                         duration: 1,
                                                         imageSize: CGSize(width: stdImgSize.width*2, height: stdImgSize.height*3),
                                                         anchorPoint: CGPoint(x:1.0/4.0, y: 1.0/6.0)))

        buildingAnimations[.SingleBed] = Animation()
        buildingAnimations[.SingleBed]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .SingleBed),
                                                                duration: 1,
                                                                imageSize: CGSize(width: stdImgSize.width*2, height: stdImgSize.height*2),
                                                                anchorPoint: CGPoint(x:1.0/4.0, y: 1.0/4.0)))

        buildingAnimations[.VendingMachine] = Animation()
        buildingAnimations[.VendingMachine]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .VendingMachine),
                                                                     duration: 1,
                                                                     imageSize: CGSize(width: stdImgSize.width*2, height: stdImgSize.height*2),
                                                                     anchorPoint: CGPoint(x:1.0/4.0, y: 1.0/4.0)))

        buildingAnimations[.FarmDeliveryBox] = Animation()
        buildingAnimations[.FarmDeliveryBox]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .FarmDeliveryBox),
                                                                duration: 1,
                                                                imageSize: CGSize(width: stdImgSize.width*2, height: stdImgSize.height*1.5),
                                                                anchorPoint: CGPoint(x:1.0/4.0, y: 1.0/3.0)))

        buildingAnimations[.Chair] = Animation()
        buildingAnimations[.Chair]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .Chair),
                                                            duration: 1,
                                                            imageSize: CGSize(width: stdImgSize.width, height: stdImgSize.height*1.5),
                                                            anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/3.0)))
        buildingAnimations[.Table] = Animation()
        buildingAnimations[.Table]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .Table),
                                                            duration: 1,
                                                            imageSize: CGSize(width: stdImgSize.width*2, height: stdImgSize.height*2),
                                                            anchorPoint: CGPoint(x:1.0/4.0, y: 1.0/4.0)))

        buildingAnimations[.PlayerHouseSign] = Animation()
        buildingAnimations[.PlayerHouseSign]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .PlayerHouseSign),
                                                                      duration: 1,
                                                                      imageSize: CGSize(width: stdImgSize.width, height: stdImgSize.height),
                                                                      anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/2.0)))
    }

    private func loadCropAnimations() {
        let stdImgSize = Config.tileSize

        buildingAnimations[.Garlic] = Animation()
        buildingAnimations[.Garlic]!.repeats = false
        buildingAnimations[.Garlic]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(cropName: "garlic1"),
                                                             duration: 1,
                                                             imageSize: CGSize(width: stdImgSize.width, height: stdImgSize.height),
                                                             anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/2.0)))
        buildingAnimations[.Garlic]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(cropName: "garlic2"),
                                                             duration: 1,
                                                             imageSize: CGSize(width: stdImgSize.width, height: stdImgSize.height),
                                                             anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/2.0)))
        buildingAnimations[.Garlic]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(cropName: "garlic3"),
                                                             duration: 2,
                                                             imageSize: CGSize(width: stdImgSize.width, height: stdImgSize.height),
                                                             anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/2.0)))
        buildingAnimations[.Garlic]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(cropName: "garlic4"),
                                                             duration: 2,
                                                             imageSize: CGSize(width: stdImgSize.width, height: stdImgSize.height),
                                                             anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/2.0)))
        buildingAnimations[.Garlic]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(cropName: "garlic5"),
                                                             duration: 2,
                                                             imageSize: CGSize(width: stdImgSize.width, height: stdImgSize.height),
                                                             anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/2.0)))
        buildingAnimations[.Garlic]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(cropName: "garlic6"),
                                                             duration: 1,
                                                             imageSize: CGSize(width: stdImgSize.width, height: stdImgSize.height),
                                                             anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/2.0)))

        buildingAnimations[.Turnip] = Animation()
        buildingAnimations[.Turnip]!.repeats = false
        buildingAnimations[.Turnip]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(cropName: "turnip1"),
                                                             duration: 1,
                                                             imageSize: CGSize(width: stdImgSize.width, height: stdImgSize.height),
                                                             anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/2.0)))
        buildingAnimations[.Turnip]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(cropName: "turnip2"),
                                                             duration: 1,
                                                             imageSize: CGSize(width: stdImgSize.width, height: stdImgSize.height),
                                                             anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/2.0)))
        buildingAnimations[.Turnip]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(cropName: "turnip3"),
                                                             duration: 1,
                                                             imageSize: CGSize(width: stdImgSize.width, height: stdImgSize.height),
                                                             anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/2.0)))
        buildingAnimations[.Turnip]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(cropName: "turnip4"),
                                                             duration: 1,
                                                             imageSize: CGSize(width: stdImgSize.width, height: stdImgSize.height),
                                                             anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/2.0)))
        buildingAnimations[.Turnip]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(cropName: "turnip5"),
                                                             duration: 1,
                                                             imageSize: CGSize(width: stdImgSize.width, height: stdImgSize.height),
                                                             anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/2.0)))
    }

    private func loadPlayerAnimations() {
        let imageSize = CGSize(width: Config.tileSize.width, height: Config.tileSize.height * 1.5)
        let anchorPoint = CGPoint(x: 0.5, y: 1.0/3.0)

        ////////////////////////////////
        // Idle Animations
        var idleAnimations = [CGVector: Animation]()
        idleAnimations[.NORTH] = Animation()
        idleAnimations[.NORTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleUp"),
                                                        duration: 1,
                                                        imageSize: imageSize,
                                                        anchorPoint: anchorPoint))

        idleAnimations[.SOUTH] = Animation()
        idleAnimations[.SOUTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleDown"),
                                                        duration: 1,
                                                        imageSize: imageSize,
                                                        anchorPoint: anchorPoint))

        idleAnimations[.WEST] = Animation()
        idleAnimations[.WEST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleLeft"),
                                                        duration: 1,
                                                        imageSize: imageSize,
                                                        anchorPoint: anchorPoint))

        idleAnimations[.EAST] = Animation()
        idleAnimations[.EAST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleRight"),
                                                        duration: 1,
                                                        imageSize: imageSize,
                                                        anchorPoint: anchorPoint))

        playerAnimations[Person.State.Idle] = idleAnimations

        ////////////////////////////////
        // Walking Animations
        var walkingAnimations = [CGVector: Animation]()
        walkingAnimations[.NORTH] = Animation()
        walkingAnimations[.NORTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerWalkUp1"),
                                                        duration: 8,
                                                        imageSize: imageSize,
                                                        anchorPoint: anchorPoint))
        walkingAnimations[.NORTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleUp"),
                                                           duration: 8,
                                                           imageSize: imageSize,
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.NORTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerWalkUp2"),
                                                           duration: 8,
                                                           imageSize: imageSize,
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.NORTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleUp"),
                                                           duration: 8,
                                                           imageSize: imageSize,
                                                           anchorPoint: anchorPoint))

        walkingAnimations[.SOUTH] = Animation()
        walkingAnimations[.SOUTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerWalkDown1"),
                                                           duration: 8,
                                                           imageSize: imageSize,
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.SOUTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleDown"),
                                                           duration: 8,
                                                           imageSize: imageSize,
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.SOUTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerWalkDown2"),
                                                           duration: 8,
                                                           imageSize: imageSize,
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.SOUTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleDown"),
                                                           duration: 8,
                                                           imageSize: imageSize,
                                                           anchorPoint: anchorPoint))

        walkingAnimations[.WEST] = Animation()
        walkingAnimations[.WEST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerWalkLeft1"),
                                                           duration: 8,
                                                           imageSize: imageSize,
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.WEST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleLeft"),
                                                           duration: 8,
                                                           imageSize: imageSize,
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.WEST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerWalkLeft2"),
                                                           duration: 8,
                                                           imageSize: imageSize,
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.WEST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleLeft"),
                                                           duration: 8,
                                                           imageSize: imageSize,
                                                           anchorPoint: anchorPoint))

        walkingAnimations[.EAST] = Animation()
        walkingAnimations[.EAST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerWalkRight1"),
                                                           duration: 8,
                                                           imageSize: imageSize,
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.EAST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleRight"),
                                                           duration: 8,
                                                           imageSize: imageSize,
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.EAST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerWalkRight2"),
                                                           duration: 8,
                                                           imageSize: imageSize,
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.EAST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleRight"),
                                                           duration: 8,
                                                           imageSize: imageSize,
                                                           anchorPoint: anchorPoint))

        playerAnimations[Person.State.Walking] = walkingAnimations
    }

    func getAnimation(person: Person) -> Animation? {
        if let stateAnimations = playerAnimations[person.state] {
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
