class GameEvent {
    let id: GameEventId
    let type: GameEventType
    let priority: Int // higher the number higher priority

    let trigger: Trigger
    let requirements: [Requirement]

    let dialogId: DialogId!

    let storeFrontId: StoreFrontId!
    let storeCatalogId: StoreCatalogId!

    let teleportId: TeleportId!

    private init(gameEventId: GameEventId, gameEventType: GameEventType, priority: Int, trigger: Trigger, requirements: [Requirement], dialogId: DialogId?, storeFrontId: StoreFrontId?, storeCatalogId: StoreCatalogId?, teleportId: TeleportId?) {
        self.id = gameEventId
        self.type = gameEventType
        self.priority = priority

        self.trigger = trigger
        self.requirements = requirements

        self.dialogId = dialogId

        self.storeFrontId = storeFrontId
        self.storeCatalogId = storeCatalogId

        self.teleportId = teleportId
    }

    convenience init(gameEventId: GameEventId, priority: Int, trigger: Trigger, requirements: [Requirement], dialogId: DialogId) {
        self.init(gameEventId: gameEventId, gameEventType: .Dialog, priority: priority,
                  trigger: trigger, requirements: requirements,
                  dialogId: dialogId, storeFrontId: nil, storeCatalogId: nil, teleportId: nil)
    }

    convenience init(gameEventId: GameEventId, priority: Int, trigger: Trigger, requirements: [Requirement], storeFrontId: StoreFrontId, storeCatalogId: StoreCatalogId) {
        self.init(gameEventId: gameEventId, gameEventType: .Store, priority: priority,
                  trigger: trigger, requirements: requirements,
                  dialogId: nil, storeFrontId: storeFrontId, storeCatalogId: storeCatalogId, teleportId: nil)
    }

    convenience init(gameEventId: GameEventId, priority: Int, trigger: Trigger, requirements: [Requirement], teleportId: TeleportId) {
        self.init(gameEventId: gameEventId, gameEventType: .Teleport, priority: priority,
                  trigger: trigger, requirements: requirements,
                  dialogId: nil, storeFrontId: nil, storeCatalogId: nil, teleportId: teleportId)
    }

    convenience init(gameEventId: GameEventId, priority: Int, trigger: Trigger, requirements: [Requirement], endDayTeleport: TeleportId) {
        self.init(gameEventId: gameEventId, gameEventType: .Sleep, priority: priority,
                  trigger: trigger, requirements: requirements,
                  dialogId: nil, storeFrontId: nil, storeCatalogId: nil, teleportId: endDayTeleport)
    }
}
