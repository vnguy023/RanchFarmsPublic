class Trigger {
    let type: TriggerType

    let actionType: ActionType!
    let buildingId: BuildingId!
    let personId: PersonId!
    let botLeftMapPoint: MapPoint!
    let topRightMapPoint: MapPoint!
    let startTime: GameTick!

    private init(triggerType: TriggerType, actionType: ActionType?,
                 buildingId: BuildingId?,
                 personId: PersonId?,
                 botLeftMapPoint: MapPoint?, topRightMapPoint: MapPoint?,
                 startTime: GameTick!) {
        self.type = triggerType

        self.actionType = actionType
        self.buildingId = buildingId
        self.personId = personId
        self.botLeftMapPoint = botLeftMapPoint
        self.topRightMapPoint = topRightMapPoint
        self.startTime = startTime
    }

    // Person
    convenience init(personId: PersonId, actionType: ActionType) {
        self.init(triggerType: .PersonId,
                  actionType: actionType,
                  buildingId: nil,
                  personId: personId,
                  botLeftMapPoint: nil, topRightMapPoint: nil,
                  startTime: nil)
    }

    // Building
    convenience init(buildingId: BuildingId, actionType: ActionType) {
        self.init(triggerType: .BuildingId,
                  actionType: actionType,
                  buildingId: buildingId,
                  personId: nil,
                  botLeftMapPoint: nil, topRightMapPoint: nil,
                  startTime: nil)
    }

    // Presence
    convenience init(start: MapPoint, end: MapPoint) {
        let botLeft = MapPoint(x: min(start.x, end.x), y: min(start.y, end.y), location: start.location)
        let topRight = MapPoint(x: max(start.x, end.x), y: max(start.y, end.y), location: start.location)

        self.init(triggerType: .Presence,
                  actionType: nil,
                  buildingId: nil,
                  personId: nil,
                  botLeftMapPoint: botLeft, topRightMapPoint: topRight,
                  startTime: nil)
    }

    // Time
    convenience init(startTime: GameTick) {
        self.init(triggerType: .Time,
                  actionType: nil,
                  buildingId: nil,
                  personId: nil,
                  botLeftMapPoint: nil, topRightMapPoint: nil,
                  startTime: startTime)
    }
}

