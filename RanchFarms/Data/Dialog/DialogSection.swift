class DialogSection {
    let portraitId: PortraitId
    let portraitName: String
    let text: String

    init (portraitId: PortraitId, portraitName: String, text: String) {
        self.portraitId = portraitId
        self.portraitName = portraitName
        
        self.text = text
    }
}
