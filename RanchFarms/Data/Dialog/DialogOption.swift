class DialogOption {
    let text: String
    let gameEventId: GameEventId?

    init (text: String, gameEventId: GameEventId?) {
        self.text = text
        self.gameEventId = gameEventId
    }
}
