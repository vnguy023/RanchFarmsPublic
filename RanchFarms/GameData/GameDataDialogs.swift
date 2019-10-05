extension GameData {

    static func getDialogTemp() -> [Dialog] {
        let portraitId = PortraitId.Dummy

        var sections = [DialogSection]()
        var data = [Dialog]()

        sections.removeAll()
        sections.append(DialogSection(portraitId: portraitId, portraitName: "TODO",
                                      text: "TODO: Fill in actual text"))
        data.append(Dialog(dialogId: .Dummy, dialogSections: sections))

        sections.removeAll()
        sections.append(DialogSection(portraitId: portraitId, portraitName: "Locked Door",
                                      text: "Door is locked. Store open at  8:00AM-6:00PM."))
        data.append(Dialog(dialogId: .Door_IsLocked, dialogSections: sections))

        sections.removeAll()
        sections.append(DialogSection(portraitId: portraitId, portraitName: "Closed Stored",
                                      text: "Store is closed."))
        data.append(Dialog(dialogId: .Store_IsClosed, dialogSections: sections))

        return data
    }

    static func getDialogLily() -> [Dialog] {
        let portraitId = PortraitId.Lily
        let portraitName = "Lily"

        var sections = [DialogSection]()
        var data = [Dialog]()

        sections.removeAll()
        sections.append(DialogSection(portraitId: portraitId, portraitName: portraitName,
                                      text: "Nice to meet you."))
        data.append(Dialog(dialogId: .Lily_Talk, dialogSections: sections))

        return data
    }

    static func getDialogJames() -> [Dialog] {
        let portraitId = PortraitId.James
        let portraitName = "James"

        var sections = [DialogSection]()
        var data = [Dialog]()

        sections.removeAll()
        sections.append(DialogSection(portraitId: portraitId, portraitName: portraitName,
                                      text: "Hey there, Check out my store for some seeds."))
        data.append(Dialog(dialogId: .James_Talk, dialogSections: sections))

        return data
    }
}

