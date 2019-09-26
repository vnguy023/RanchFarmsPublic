class Trigger {
    let type: TriggerType

    let actionType: ActionType!
    let buildingId: BuildingId!
    let personId: PersonId!
    let botLeftMapPoint: MapPoint!
    let topRightMapPoint: MapPoint!
    private init(triggerType: TriggerType, actionType: ActionType?,
                 buildingId: BuildingId?,
                 personId: PersonId?,
                 botLeftMapPoint: MapPoint?,
                 topRightMapPoint: MapPoint?) {
        self.type = triggerType

        self.actionType = actionType
        self.buildingId = buildingId
        self.personId = personId
        self.botLeftMapPoint = botLeftMapPoint
        self.topRightMapPoint = topRightMapPoint
    }

    // Person
    convenience init(personId: PersonId, actionType: ActionType) {
        self.init(triggerType: .PersonId,
                  actionType: actionType,
                  buildingId: nil,
                  personId: personId,
                  botLeftMapPoint: nil,
                  topRightMapPoint: nil)
    }

    // Building
    convenience init(buildingId: BuildingId, actionType: ActionType) {
        self.init(triggerType: .BuildingId,
                  actionType: actionType,
                  buildingId: buildingId,
                  personId: nil,
                  botLeftMapPoint: nil,
                  topRightMapPoint: nil)
    }

    // Presence
    convenience init(botLeftMapPoint: MapPoint, topRightMapPoint: MapPoint) {
        self.init(triggerType: .Presence,
                  actionType: nil,
                  buildingId: nil,
                  personId: nil,
                  botLeftMapPoint: botLeftMapPoint,
                  topRightMapPoint: topRightMapPoint)
    }
}

