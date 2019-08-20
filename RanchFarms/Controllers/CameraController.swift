import SpriteKit

class CameraController {
    let camera = SKCameraNode()

    init() {

    }

    func moveTo(position: CGPoint) {
        camera.position = position
    }

    func pan(vector: CGVector) {
        camera.position.x += vector.dx
        camera.position.y += vector.dy
    }
}
