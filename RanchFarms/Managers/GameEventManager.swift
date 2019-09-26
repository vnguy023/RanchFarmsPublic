import SpriteKit

class GameEventManager {
    static let shared = GameEventManager()

    private var gameEventMap = [GameEventId: GameEvent]()

    private init() {
        GameData.getGameEventDialogs().forEach({gameEventMap[$0.id] = $0})
        GameData.getGameEventStores().forEach({gameEventMap[$0.id] = $0})
        GameData.getGameEventTeleports().forEach({gameEventMap[$0.id] = $0})
    }

    func getGameEvent(gameEventId: GameEventId) -> GameEvent? {
        if let gameEvent = gameEventMap[gameEventId] {
            return gameEvent
        }

        print ("[GameEventManager] [Desc=GameEvent not found] [GameEventId=\(gameEventId)]")
        return nil
    }

    // TODO: need to verify this
    func getGameEventsTriggered(personId: PersonId, actionType: ActionType) -> [GameEvent] {
        var result = [GameEvent]()
        for gameEvent in gameEventMap.filter({$0.value.trigger.type == .PersonId}) {
            if gameEvent.value.trigger.actionType == actionType && personId == gameEvent.value.trigger.personId {
                result.append(gameEvent.value)
            }
        }
        return result.sorted(by: {return $0.priority < $1.priority})
    }

    func getGameEventsTriggered(buildingId: BuildingId, actionType: ActionType) -> [GameEvent] {
        var result = [GameEvent]()
        for gameEvent in gameEventMap.filter({$0.value.trigger.type == .BuildingId}) {
            if gameEvent.value.trigger.actionType == actionType && buildingId == gameEvent.value.trigger.buildingId {
                result.append(gameEvent.value)
            }
        }
        return result.sorted(by: {return $0.priority < $1.priority})
    }

    // TODO: still need to verify this
    func getGameEventsTriggered(boundary: CGRect, location: Location) -> [GameEvent] {
        var result = [GameEvent]()
        for gameEvent in gameEventMap.filter({$0.value.trigger.type == .Presence}) {
            if gameEvent.value.trigger.botLeftMapPoint.location == location {
                let triggerBoundary = CGRect(x: CGFloat(gameEvent.value.trigger.botLeftMapPoint.x) * Config.tileSize.width,
                                             y: CGFloat(gameEvent.value.trigger.botLeftMapPoint.x) * Config.tileSize.height,
                                             width: CGFloat(gameEvent.value.trigger.topRightMapPoint.x - gameEvent.value.trigger.topRightMapPoint.x) * Config.tileSize.height,
                                             height: CGFloat(gameEvent.value.trigger.topRightMapPoint.y - gameEvent.value.trigger.topRightMapPoint.y) * Config.tileSize.height)
                if boundary.intersects(triggerBoundary) {
                    result.append(gameEvent.value)
                }
            }
        }
        return result.sorted(by: {return $0.priority < $1.priority})
    }
}
