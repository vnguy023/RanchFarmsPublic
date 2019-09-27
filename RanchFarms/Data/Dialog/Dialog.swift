class Dialog {
    let id: DialogId

    let portraitId: PortraitId
    let text: String

    init (dialogId: DialogId, portraitId: PortraitId, text: String) {
        self.id = dialogId

        self.portraitId = portraitId
        self.text = text
    }
}
