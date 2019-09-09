import SpriteKit

class Animation {
    var frames = [AnimationFrame]() // direction

    init() {}

    func addFrame(_ frame: AnimationFrame) {
        frames.append(frame)
    }

    func getFrame(timeElapsed: CGFloat) -> AnimationFrame!{
        // TODO: Temporary until we figure this out
        return frames.first
    }
}
