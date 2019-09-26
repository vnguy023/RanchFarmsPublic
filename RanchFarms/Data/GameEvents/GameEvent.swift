class GameEvent {
    let id: GameEventId
    let type: GameEventType
    let priority: Int // higher the number higher priority

    let trigger: Trigger
    let requirements: [Requirement]

    let storeFrontId: StoreFrontId!
    let storeCatalogId: StoreCatalogId!

    let teleportId: TeleportId!

    private init(gameEventId: GameEventId, gameEventType: GameEventType, priority: Int, trigger: Trigger, requirements: [Requirement], storeFrontId: StoreFrontId?, storeCatalogId: StoreCatalogId?, teleportId: TeleportId?) {
        self.id = gameEventId
        self.type = gameEventType
        self.priority = priority

        self.trigger = trigger
        self.requirements = requirements

        self.storeFrontId = storeFrontId
        self.storeCatalogId = storeCatalogId

        self.teleportId = teleportId
    }

    // Temporary until we figure out a data structure to represent this
    convenience init(gameEventId: GameEventId, priority: Int, trigger: Trigger, requirements: [Requirement], dialogId: Int) {
        self.init(gameEventId: gameEventId, gameEventType: .Dialog, priority: priority, trigger: trigger, requirements: requirements, storeFrontId: nil, storeCatalogId: nil, teleportId: nil)
    }

    convenience init(gameEventId: GameEventId, priority: Int, trigger: Trigger, requirements: [Requirement], storeFrontId: StoreFrontId, storeCatalogId: StoreCatalogId) {
        self.init(gameEventId: gameEventId, gameEventType: .Store, priority: priority, trigger: trigger, requirements: requirements, storeFrontId: storeFrontId, storeCatalogId: storeCatalogId, teleportId: nil)
    }

    convenience init(gameEventId: GameEventId, priority: Int, trigger: Trigger, requirements: [Requirement], teleportId: TeleportId) {
        self.init(gameEventId: gameEventId, gameEventType: .Teleport, priority: priority, trigger: trigger, requirements: requirements, storeFrontId: nil, storeCatalogId: nil, teleportId: teleportId)
    }
}
