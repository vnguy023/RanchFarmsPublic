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
        return result.sorted(by: {return $0.priority > $1.priority})
    }

    func getGameEventsTriggered(buildingId: BuildingId, actionType: ActionType) -> [GameEvent] {
        var result = [GameEvent]()
        for gameEvent in gameEventMap.filter({$0.value.trigger.type == .BuildingId}) {
            if gameEvent.value.trigger.actionType == actionType && buildingId == gameEvent.value.trigger.buildingId {
                result.append(gameEvent.value)
            }
        }
        return result.sorted(by: {return $0.priority > $1.priority})
    }

    func getGameEventsTriggered(boundary: CGRect, location: Location) -> [GameEvent] {
        var result = [GameEvent]()
        for gameEvent in gameEventMap.filter({$0.value.trigger.type == .Presence}) {
            if gameEvent.value.trigger.botLeftMapPoint.location == location {
                let triggerBoundary = CGRect(x: CGFloat(gameEvent.value.trigger.botLeftMapPoint.x) * Config.tileSize.width - Config.tileSize.width/2,
                                             y: CGFloat(gameEvent.value.trigger.botLeftMapPoint.y) * Config.tileSize.height - Config.tileSize.height/2,
                                             width: CGFloat(gameEvent.value.trigger.topRightMapPoint.x - gameEvent.value.trigger.botLeftMapPoint.x + 1) * Config.tileSize.width,
                                             height: CGFloat(gameEvent.value.trigger.topRightMapPoint.y - gameEvent.value.trigger.botLeftMapPoint.y + 1) * Config.tileSize.height)
                if boundary.intersects(triggerBoundary) {
                    result.append(gameEvent.value)
                }
            }
        }
        return result.sorted(by: {return $0.priority > $1.priority})
    }
}
