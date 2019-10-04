class Dialog {
    let id: DialogId

    let portraitId: PortraitId
    let portraitName: String
    let text: String

    init (dialogId: DialogId, portraitId: PortraitId, portraitName: String, text: String) {
        self.id = dialogId

        self.portraitId = portraitId
        self.portraitName = portraitName
        
        self.text = text
    }
}
