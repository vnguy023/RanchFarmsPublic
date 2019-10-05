class DialogSection {
    let portraitId: PortraitId
    let portraitName: String
    let text: String
    let dialogOptions: [DialogOption]

    init (portraitId: PortraitId, portraitName: String, text: String, dialogOptions: [DialogOption]) {
        self.portraitId = portraitId
        self.portraitName = portraitName
        
        self.text = text
        self.dialogOptions = dialogOptions
    }

    convenience init (portraitId: PortraitId, portraitName: String, text: String) {
        self.init(portraitId: portraitId, portraitName: portraitName, text: text, dialogOptions: [DialogOption]())
    }
}
