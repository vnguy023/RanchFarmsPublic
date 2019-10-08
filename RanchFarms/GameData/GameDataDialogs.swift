extension GameData {

    static func getDialogTemp() -> [Dialog] {
        let portraitId = PortraitId.Dummy

        var sections = [DialogSection]()
        var dialogOptions = [DialogOption]()
        let gifts = [Gift]()
        var data = [Dialog]()

        sections.removeAll()
        sections.append(DialogSection(portraitId: portraitId, portraitName: "TODO",
                                      text: "TODO: Fill in actual text"))
        data.append(Dialog(dialogId: .Dummy, dialogSections: sections))

        sections.removeAll()
        sections.append(DialogSection(portraitId: portraitId, portraitName: "Locked Door",
                                      text: "Door is locked."))
        sections.append(DialogSection(portraitId: portraitId, portraitName: "Locked Door",
                                      text: "Come back at 8:00AM-6:00PM."))
        dialogOptions.removeAll()
        dialogOptions.append(DialogOption(text: "Yes", gifts: gifts, gameEventId: .Teleport_Town_GeneralStore))
        dialogOptions.append(DialogOption(text: "No", gifts: gifts, gameEventId: nil))
        sections.append(DialogSection(portraitId: portraitId, portraitName: "Locked Door",
                                      text: "Do you want to enter anyways?",
                                      dialogOptions: dialogOptions))
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
                                      text: "Hey, You are that new guy."))
        data.append(Dialog(dialogId: .Lily_Greeting, dialogSections: sections))

        sections.removeAll()
        sections.append(DialogSection(portraitId: portraitId, portraitName: portraitName,
                                      text: "What was your name again?"))
        data.append(Dialog(dialogId: .Lily_Talk, dialogSections: sections))

        return data
    }

    static func getDialogJames() -> [Dialog] {
        let portraitId = PortraitId.James
        let portraitName = "James"

        var sections = [DialogSection]()
        var dialogOptions = [DialogOption]()
        var gifts = [Gift]()
        var items = [Item]()

        var data = [Dialog]()

        sections.removeAll()
        sections.append(DialogSection(portraitId: portraitId, portraitName: portraitName,
                                      text: "Hey there, Check out my store for some seeds."))

        dialogOptions.removeAll()
        gifts.removeAll()
        items.removeAll()
        items.append(Item(itemId: .Crab, quantity: 2))
        gifts.append(Gift(giftType: .Item, items: items))
        dialogOptions.append(DialogOption(text: "Ok, Thank you.", gifts: gifts, gameEventId: nil))
        sections.append(DialogSection(portraitId: portraitId, portraitName: portraitName,
                                      text: "Here take these items to start",
                                      dialogOptions: dialogOptions))
        data.append(Dialog(dialogId: .James_Greeting, dialogSections: sections))

        sections.removeAll()
        sections.append(DialogSection(portraitId: portraitId, portraitName: portraitName,
                                      text: "Please remember to visit the store sometime."))
        data.append(Dialog(dialogId: .James_Talk, dialogSections: sections))

        return data
    }
}

