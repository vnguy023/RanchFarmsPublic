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

    func getTexture(person: Person) -> SKTexture? {
        if person.faceDirection == CGVector.NORTH {
            return TextureManager.shared.getTexture(personTextureName: "playerIdleUp")
        } else if person.faceDirection == CGVector.SOUTH {
            return TextureManager.shared.getTexture(personTextureName: "playerIdleDown")
        } else if person.faceDirection == CGVector.WEST {
            return TextureManager.shared.getTexture(personTextureName: "playerIdleLeft")
        } else if person.faceDirection == CGVector.EAST {
            return TextureManager.shared.getTexture(personTextureName: "playerIdleRight")
        }

        return nil
    }
}
