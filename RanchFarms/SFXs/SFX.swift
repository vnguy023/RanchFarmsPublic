import SpriteKit

class SFX {
    var frames = [SFXFrame]()
    var repeats = true

    private var totalDuration: Int {
        get {
            var result = 0
            frames.forEach({result += $0.duration})
            return result
        }
    }

    init() {}

    func addFrame(_ frame: SFXFrame) {
        frames.append(frame)
    }

    func getFrame(progress: CGFloat) -> SFXFrame!{
        var timeElapsed = Int(progress * CGFloat(totalDuration))
        if repeats { timeElapsed = timeElapsed % totalDuration }

        var result: SFXFrame? = nil

        for frame in frames {
            if timeElapsed >= 0 {
                result = frame
                timeElapsed -= frame.duration
            } else {
                return result
            }
        }

        return result
    }
}
