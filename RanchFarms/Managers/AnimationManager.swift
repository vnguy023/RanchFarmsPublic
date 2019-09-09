import SpriteKit

class AnimationManager {
    static let shared = AnimationManager()

    private var playerAnimations = [Person.State: [CGVector: Animation]]()

    private init() {
        loadPlayerAnimations()
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
}
