import SpriteKit

class SFXFrame{
    let translation: CGPoint // Need to scale to tileSize
    let rotation: CGFloat
    let duration: Int // used for determing how long it takes effect

    init(translation: CGPoint, rotation: CGFloat, duration: Int) {
        self.translation = translation
        self.rotation = rotation
        self.duration = duration
    }
}
