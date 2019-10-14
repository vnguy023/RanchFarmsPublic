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

    static let dayInfoSize = CGSize(width: 150, height: 105)

    static var viewDialogSize = CGSize(width: Config.screenSize.width, height: 240)
    static var viewDialogPortraitSize = CGSize(width: 240, height: 240)

    static var viewGameNotificationItemSize = CGSize(width: 300, height: Config.itemImageSize.height + 8)

    static let viewInventoryColumns = CGFloat(10)
    static let viewInventoryRows = CGFloat(3)

    static var viewStoreSize: CGSize{ get {return Config.screenSize} }
    static let viewStoreClerkSize = CGSize(width: 200, height: 200)
    static let viewStoreSloganSize = CGSize(width: 200, height: 60)
    static let viewStoreItemInfoPortraitSize = CGSize(width: 96, height: 96)

    static let viewStoreItemColumns = CGFloat(10)
    static let viewStoreItemRows = CGFloat(3)

    static var viewSaveSlotSize = CGSize(width: 600, height: 120)

    static let SaveDirectory = "savefiles/"
    static let SaveFileName1 = "save1"
    static let SaveFileName2 = "save2"
    static let SaveFileName3 = "save3"
    static let SaveFileNameTemp = "Temp" // This is for us to validate that we can load it
    static let SaveFileExtension = "json"
    static let SaveSlotCount = 3

    static let animationWalkGameTickDuration = GameTick(30)
    static let animationHoeingGameTickDuration = GameTick(40)

    static let GameTicksPerSecond = GameTick(60)
    static let MaxGameTickUpdatesPerCycle = GameTick(6)// only allow us to be behind by this much
    static let GameTicksPerGameMinute = GameTick(42)
    static var GameTicksPerGameHour: GameTick { get {return GameTicksPerGameMinute * 60} }
    static let GameDaysPerMonth = 28

    static var teleportSystemUpdateInterval: GameTick { get {return GameTicksPerSecond / 4} }
    static var npcScheduleSystemUpdateInterval: GameTick { get {return GameTicksPerGameMinute * 5} }

    private init() {

    }
}
