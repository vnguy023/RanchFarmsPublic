class GameEvent {
    let id: GameEventId
    let type: GameEventType

    let storeFrontId: StoreFrontId!
    let storeCatalogId: StoreCatalogId!

    let teleportId: TeleportId!

    private init(gameEventId: GameEventId, gameEventType: GameEventType, storeFrontId: StoreFrontId?, storeCatalogId: StoreCatalogId?, teleportId: TeleportId?) {
        self.id = gameEventId
        self.type = gameEventType

        self.storeFrontId = storeFrontId
        self.storeCatalogId = storeCatalogId

        self.teleportId = teleportId
    }

    // Temporary until we figure out a datasturecture to represent this
    convenience init(gameEventId: GameEventId, dialogId: Int) {
        self.init(gameEventId: gameEventId, gameEventType: .Dialog, storeFrontId: nil, storeCatalogId: nil, teleportId: nil)
    }

    convenience init(gameEventId: GameEventId, storeFrontId: StoreFrontId, storeCatalogId: StoreCatalogId) {
        self.init(gameEventId: gameEventId, gameEventType: .Store, storeFrontId: storeFrontId, storeCatalogId: storeCatalogId, teleportId: nil)
    }

    convenience init(gameEventId: GameEventId, teleportId: TeleportId) {
        self.init(gameEventId: gameEventId, gameEventType: .Teleport, storeFrontId: nil, storeCatalogId: nil, teleportId: teleportId)
    }
}
