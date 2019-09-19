
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

        let frame = SFXFrame(translation: CGPoint(),
                             rotation: 0,
                             duration: 1)
        sfx.addFrame(frame)

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
