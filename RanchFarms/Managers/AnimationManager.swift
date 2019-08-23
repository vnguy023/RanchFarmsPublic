import SpriteKit

class AnimationManager {
    static let shared = AnimationManager()

    private init() {

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
