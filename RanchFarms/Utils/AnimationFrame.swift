import SpriteKit

class AnimationFrame{
    let texture: SKTexture?
    let imageSize: CGSize
    let duration = Int(8) // used for determing how long it should be displayed
    let anchorPoint: CGPoint
    let positionOffset = CGPoint(x: 0, y: 0)

    init(texture: SKTexture?, imageSize: CGSize, anchorPoint: CGPoint) {
        self.texture = texture
        self.imageSize = imageSize
        self.anchorPoint = anchorPoint
    }
}
