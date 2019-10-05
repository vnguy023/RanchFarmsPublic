class Dialog {
    let id: DialogId

    let sections: [DialogSection]

    init (dialogId: DialogId, dialogSections: [DialogSection]) {
        self.id = dialogId

        self.sections = dialogSections
    }
}
