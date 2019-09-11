import SpriteKit

class Config {
    static let shared = Config()

    // Make this temporary for now
    static let screenSize = CGSize(width: 1024, height: 768)
    static let frameRate = 60.0
    static let blackScreenFadeTime = 2.0

    static let viewMoneySize = CGSize(width: 150, height: 32)

    static let itemImageSize = CGSize(width: 72, height: 72)
    static let tileSize = CGSize(width: 32, height: 32)

    static let dayInfoSize = CGSize(width: 150, height: 50)

    static let viewInventoryColumns = CGFloat(10)
    static let viewInventoryRows = CGFloat(3)

    static var viewStoreSize: CGSize{ get {return Config.screenSize} }
    static let viewStoreClerkSize = CGSize(width: 200, height: 200)
    static let viewStoreSloganSize = CGSize(width: 200, height: 60)
    static let viewStoreItemInfoPortraitSize = CGSize(width: 96, height: 96)

    static let viewStoreItemColumns = CGFloat(10)
    static let viewStoreItemRows = CGFloat(3)

    static var viewDialogSize = CGSize(width: Config.screenSize.width, height: 300)

    static let SaveDirectory = "savefiles/"
    static let SaveFileName1 = "save1"
    static let SaveFileName2 = "save2"
    static let SaveFileName3 = "save3"
    static let SaveFileExtension = "json"

    static let animationWalkGameTickDuration = GameTick(30)

    static let GameTicksPerSecond = GameTick(60)
    static let MaxGameTickUpdatesPerCycle = GameTick(6)// only allow us to be behind by this much

    private init() {

    }
}
