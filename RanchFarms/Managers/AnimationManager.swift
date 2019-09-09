import SpriteKit

class AnimationManager {
    static let shared = AnimationManager()

    private var playerAnimations = [Person.State: [CGVector: Animation]]()

    private var buildingAnimations = [BuildingId: Animation]()

    private init() {
        loadBuildingAnimations()
        loadPlayerAnimations()
    }

    private func loadBuildingAnimations() {
        let stdImgSize = Config.tileSize

        buildingAnimations[.SingleBed] = Animation()
        buildingAnimations[.SingleBed]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .SingleBed),
                                                                imageSize: CGSize(width: stdImgSize.width, height: stdImgSize.height*2),
                                                                anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/4.0)))

        buildingAnimations[.Door] = Animation()
        buildingAnimations[.Door]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .Door),
                                                           imageSize: CGSize(width: stdImgSize.width, height: stdImgSize.height*2),
                                                           anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/4.0)))

        buildingAnimations[.TV] = Animation()
        buildingAnimations[.TV]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .TV),
                                                         imageSize: CGSize(width: stdImgSize.width*2, height: stdImgSize.height*3),
                                                         anchorPoint: CGPoint(x:1.0/4.0, y: 1.0/6.0)))

        buildingAnimations[.SingleBed] = Animation()
        buildingAnimations[.SingleBed]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .SingleBed),
                                                                imageSize: CGSize(width: stdImgSize.width*2, height: stdImgSize.height*2),
                                                                anchorPoint: CGPoint(x:1.0/4.0, y: 1.0/4.0)))

        buildingAnimations[.VendingMachine] = Animation()
        buildingAnimations[.VendingMachine]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .VendingMachine),
                                                                     imageSize: CGSize(width: stdImgSize.width, height: stdImgSize.height*2),
                                                                     anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/4.0)))

        buildingAnimations[.FarmDeliveryBox] = Animation()
        buildingAnimations[.FarmDeliveryBox]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .FarmDeliveryBox),
                                                                imageSize: CGSize(width: stdImgSize.width*2, height: stdImgSize.height),
                                                                anchorPoint: CGPoint(x:1.0/4.0, y: 1.0/2.0)))

        buildingAnimations[.Chair] = Animation()
        buildingAnimations[.Chair]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .Chair),
                                                            imageSize: CGSize(width: stdImgSize.width, height: stdImgSize.height),
                                                            anchorPoint: CGPoint(x:1.0/2.0, y: 1.0/2.0)))
        buildingAnimations[.Table] = Animation()
        buildingAnimations[.Table]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .Table),
                                                            imageSize: CGSize(width: stdImgSize.width*2, height: stdImgSize.height*2),
                                                            anchorPoint: CGPoint(x:1.0/4.0, y: 1.0/4.0)))

        buildingAnimations[.PlayerHouseSign] = Animation()
        buildingAnimations[.PlayerHouseSign]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(buildingId: .PlayerHouseSign),
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
                                                        imageSize: imageSize,
                                                        anchorPoint: anchorPoint))

        idleAnimations[.SOUTH] = Animation()
        idleAnimations[.SOUTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleDown"),
                                                        imageSize: imageSize,
                                                        anchorPoint: anchorPoint))

        idleAnimations[.WEST] = Animation()
        idleAnimations[.WEST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleLeft"),
                                                        imageSize: imageSize,
                                                        anchorPoint: anchorPoint))

        idleAnimations[.EAST] = Animation()
        idleAnimations[.EAST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleRight"),
                                                        imageSize: imageSize,
                                                        anchorPoint: anchorPoint))

        playerAnimations[Person.State.Idle] = idleAnimations

        ////////////////////////////////
        // Walking Animations
        var walkingAnimations = [CGVector: Animation]()
        walkingAnimations[.NORTH] = Animation()
        walkingAnimations[.NORTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerWalkUp1"),
                                                        imageSize: imageSize,
                                                        anchorPoint: anchorPoint))
        walkingAnimations[.NORTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleUp"),
                                                           imageSize: imageSize,
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.NORTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerWalkUp2"),
                                                           imageSize: imageSize,
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.NORTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleUp"),
                                                           imageSize: imageSize,
                                                           anchorPoint: anchorPoint))

        walkingAnimations[.SOUTH] = Animation()
        walkingAnimations[.SOUTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerWalkDown1"),
                                                           imageSize: imageSize,
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.SOUTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleDown"),
                                                           imageSize: imageSize,
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.SOUTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerWalkDown2"),
                                                           imageSize: imageSize,
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.SOUTH]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleDown"),
                                                           imageSize: imageSize,
                                                           anchorPoint: anchorPoint))

        walkingAnimations[.WEST] = Animation()
        walkingAnimations[.WEST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerWalkLeft1"),
                                                           imageSize: imageSize,
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.WEST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleLeft"),
                                                           imageSize: imageSize,
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.WEST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerWalkLeft2"),
                                                           imageSize: imageSize,
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.WEST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleLeft"),
                                                           imageSize: imageSize,
                                                           anchorPoint: anchorPoint))

        walkingAnimations[.EAST] = Animation()
        walkingAnimations[.EAST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerWalkRight1"),
                                                           imageSize: imageSize,
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.EAST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleRight"),
                                                           imageSize: imageSize,
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.EAST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerWalkRight2"),
                                                           imageSize: imageSize,
                                                           anchorPoint: anchorPoint))
        walkingAnimations[.EAST]!.addFrame(AnimationFrame(texture: TextureManager.shared.getTexture(personTextureName: "playerIdleRight"),
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
