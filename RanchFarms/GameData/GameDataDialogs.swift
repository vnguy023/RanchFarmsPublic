extension GameData {

    static func getDialogTemp() -> [Dialog] {
        let portraitId = PortraitId.Dummy

        var data = [Dialog]()

        data.append(Dialog(dialogId: .Dummy, portraitId: portraitId, portraitName: "TODO",
                           text: "TODO: Fill in actual text"))

        data.append(Dialog(dialogId: .Door_IsLocked, portraitId: portraitId, portraitName: "Locked Door",
                           text: "Door is locked. Come back Later"))

        data.append(Dialog(dialogId: .Store_IsClosed, portraitId: portraitId, portraitName: "Closed Stored",
                           text: "Store is closed. Come back Later"))

        return data
    }

    static func getDialogLily() -> [Dialog] {
        let portraitId = PortraitId.Lily
        let portraitName = "Lily"

        var data = [Dialog]()

        data.append(Dialog(dialogId: .Lily_Talk, portraitId: portraitId, portraitName: portraitName,
                           text: "Nice to meet you."))

        return data
    }

    static func getDialogJames() -> [Dialog] {
        let portraitId = PortraitId.James
        let portraitName = "James"

        var data = [Dialog]()

        data.append(Dialog(dialogId: .James_Talk, portraitId: portraitId, portraitName: portraitName,
                           text: "Hey there, Check out my store for some seeds."))

        return data
    }
}

