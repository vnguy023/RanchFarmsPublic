
import SpriteKit

class SFXManager {
    static let shared = SFXManager()

    private var sfxMap = [SFXId: SFX]()

    private init() {
        loadShake()
        loadSpin()
    }

    func getSFX(sfxId: SFXId) -> SFX? {
        return sfxMap[sfxId]
    }

    private func loadShake() {
        let sfx = SFX()
        sfx.repeats = false

        for i in 0..<4 {
            let frame = SFXFrame(translation: CGPoint(x: (-0.062)*(CGFloat(i)/4), y: 0),
                                 rotation: (CGFloat.pi*2/16)*(CGFloat(i)/16),
                                 duration: 1)
            sfx.addFrame(frame)
        }
        for i in 0..<8 {
            let frame = SFXFrame(translation: CGPoint(x: (0.125)*(CGFloat(i)/8) - 0.062, y: 0),
                                 rotation: (CGFloat.pi*2/16)*(CGFloat(i) / -16) + (CGFloat.pi*2/16) * 0.25,
                                 duration: 1)
            sfx.addFrame(frame)
        }
        for i in 0..<4 {
            let frame = SFXFrame(translation: CGPoint(x: (-0.062)*(CGFloat(i)/4) + 0.062, y: 0),
                                 rotation: (CGFloat.pi*2/16)*(CGFloat(i)/16) - (CGFloat.pi*2/16) * 0.25,
                                 duration: 1)
            sfx.addFrame(frame)
        }

        sfxMap[.Shake] = sfx
    }

    private func loadSpin() {
        let sfx = SFX()
        sfx.repeats = true

        for i in 0..<16 {
            let frame = SFXFrame(translation: CGPoint(),
                                 rotation: (CGFloat.pi*2)*(CGFloat(i)/16),
                                 duration: 1)
            sfx.addFrame(frame)
        }

        sfxMap[.Spin] = sfx
    }
}
