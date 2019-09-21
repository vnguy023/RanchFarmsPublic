import SpriteKit

class AnimationFrame{
    let texture: SKTexture?
    let duration: Int // used for determing how long it should be displayed
    let imageSize: CGSize // must be scaled out to tileSize
    let anchorPoint: CGPoint

    init(texture: SKTexture?, duration: Int, imageSize: CGSize, anchorPoint: CGPoint) {
        self.texture = texture
        self.imageSize = imageSize
        self.duration = duration
        self.anchorPoint = anchorPoint
    }
}
