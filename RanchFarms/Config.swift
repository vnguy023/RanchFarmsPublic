import SpriteKit

class Config {
    static let shared = Config()

    static let viewMoneySize = CGSize(width: 150, height: 32)

    static let itemImageSize = CGSize(width: 72, height: 72)
    static let tileSize = CGSize(width: 32, height: 32)

    static let dayInfoSize = CGSize(width: 100, height: 50)

    private init() {

    }
}
