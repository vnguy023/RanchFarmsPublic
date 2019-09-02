import SpriteKit

class CameraController {
    let camera = SKCameraNode()

    var gameObjectToFollow: GameObject!

    var blackScreen = SKSpriteNode(color: .black, size: Config.screenSize)

    init() {
        camera.setScale(0.5)

        blackScreen.zPosition = 0
        camera.addChild(blackScreen)
    }

    func update() {
        if gameObjectToFollow != nil {
            moveTo(position: gameObjectToFollow.position)
        }

        if blackScreen.alpha > 0 {
            blackScreen.alpha -= CGFloat (1.0 / Config.blackScreenFadeTime / Config.frameRate)
        }
    }

    func moveTo(position: CGPoint) {
        camera.position = position
    }

    func fadeScreen() {
        blackScreen.alpha = 1
    }
}
