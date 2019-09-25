import SpriteKit

class GameEventManager {
    static let shared = GameEventManager()

    private var gameEventMap = [GameEventId: GameEvent]()

    private init() {
        loadDialog()
        loadStores()
        loadTeleports()
    }

    func getGameEvent(gameEventId: GameEventId) -> GameEvent? {
        if let gameEvent = gameEventMap[gameEventId] {
            return gameEvent
        }

        print ("[GameEventManager] [Desc=GameEvent not found] [GameEventId=\(gameEventId)]")
        return nil
    }

    private func loadDialog() {
        gameEventMap[.Dialog_Sign] = GameEvent(gameEventId: .Dialog_Sign, dialogId: 0)
    }

    private func loadStores() {
        gameEventMap[.Store_VendingMachine] = GameEvent(gameEventId: .Store_VendingMachine,
                                                        storeFrontId: .VendingMachine,
                                                        storeCatalogId: .VendingMachine)
    }

    private func loadTeleports() {
        gameEventMap[.Teleport_House_Farm] = GameEvent(gameEventId: .Teleport_House_Farm, teleportId: .House_Farm)

        gameEventMap[.Teleport_Farm_House] = GameEvent(gameEventId: .Teleport_Farm_House, teleportId: .Farm_House)
        gameEventMap[.Teleport_Farm_Town] = GameEvent(gameEventId: .Teleport_Farm_Town, teleportId: .Farm_Town)

        gameEventMap[.Teleport_GeneralStore_Town] = GameEvent(gameEventId: .Teleport_GeneralStore_Town, teleportId: .GeneralStore_Town)

        gameEventMap[.Teleport_SouthBeach_Town] = GameEvent(gameEventId: .Teleport_SouthBeach_Town, teleportId: .SouthBeach_Town)

        gameEventMap[.Teleport_Town_Farm] = GameEvent(gameEventId: .Teleport_Town_Farm, teleportId: .Town_Farm)
        gameEventMap[.Teleport_Town_GeneralStore] = GameEvent(gameEventId: .Teleport_Town_GeneralStore, teleportId: .Town_GeneralStore)
        gameEventMap[.Teleport_Town_SouthBeach] = GameEvent(gameEventId: .Teleport_Town_SouthBeach, teleportId: .Town_SouthBeach)
    }
}
