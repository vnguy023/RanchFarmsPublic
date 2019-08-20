import SpriteKit

class CameraController {
    let camera = SKCameraNode()

    var gameObjectToFollow: GameObject!

    init() {

    }

    func update() {
        if gameObjectToFollow != nil {
            moveTo(position: gameObjectToFollow.position)
        }
    }

    func moveTo(position: CGPoint) {
        camera.position = position
    }
}
