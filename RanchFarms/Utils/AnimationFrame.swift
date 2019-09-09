import SpriteKit

class AnimationFrame{
    let texture: SKTexture?
    let imageSize: CGSize
    private let duration = CGFloat(1) // used for determing how long it should be displayed
    let anchorPoint: CGPoint
    let positionOffset = CGPoint(x: 0, y: 0)

    init(texture: SKTexture?, imageSize: CGSize, anchorPoint: CGPoint) {
        self.texture = texture
        self.imageSize = imageSize
        self.anchorPoint = anchorPoint
    }
}
