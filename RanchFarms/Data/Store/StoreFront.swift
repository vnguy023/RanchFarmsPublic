import SpriteKit

class StoreFront {
    let id: StoreFrontId

    let portraitId: PortraitId
    let slogan: String

    init(storeFrontId: StoreFrontId, portraitId: PortraitId, slogan: String) {
        self.id = storeFrontId
        self.portraitId = portraitId
        self.slogan = slogan
    }
}
