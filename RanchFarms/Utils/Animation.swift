import SpriteKit

class Animation {
    var frames = [AnimationFrame]()
    var repeats = true

    private var totalDuration: Int {
        get {
            var result = 0
            frames.forEach({result += $0.duration})
            return result
        }
    }

    init() {}

    func addFrame(_ frame: AnimationFrame) {
        frames.append(frame)
    }

    func getFrame(cropProgress: Int) -> AnimationFrame!{
        var timeElapsed = cropProgress
        if repeats { timeElapsed = timeElapsed % totalDuration }

        var result: AnimationFrame? = nil

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

    func getFrame(animationProgress: CGFloat) -> AnimationFrame!{
        var timeElapsed = Int(animationProgress * CGFloat(totalDuration))
        if repeats { timeElapsed = timeElapsed % totalDuration }

        var result: AnimationFrame? = nil

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
