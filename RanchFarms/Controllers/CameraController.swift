import SpriteKit

class CameraController {
    let camera = SKCameraNode()

    var gameObjectToFollow: GameObject!

    init() {
        camera.setScale(0.5)
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
