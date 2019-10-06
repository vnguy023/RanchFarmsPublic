class DialogOption {
    let text: String
    let gameEventId: GameEventId?
    let gifts: [Gift]

    init (text: String, gifts: [Gift], gameEventId: GameEventId?) {
        self.text = text
        self.gameEventId = gameEventId
        self.gifts = gifts
    }
}
