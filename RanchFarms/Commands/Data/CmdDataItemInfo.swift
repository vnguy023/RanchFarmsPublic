import Foundation

class CmdDataItemInfo: Command {
    // Output
    var itemInfos = [ItemInfo]()
    var result = Result.AwaitingExecution

    enum Result {
        case AwaitingExecution
        case Success

        case NoFile
        case BadFile
    }

    init() {
    }

    func execute() {
        var text = ""
        do {
            if let path = Bundle.main.path(forResource: "ItemInfo", ofType: "csv") {
                try text = String(contentsOfFile: path, encoding: .utf8)
            } else {
                result = .NoFile
                return
            }
        } catch {
            result = .NoFile
            return
        }

        let cmdConvertCSV = CmdConvertCSV(text: text)
        cmdConvertCSV.execute()

        if cmdConvertCSV.result != .Success {
            result = .BadFile
        }

        // Skipping line one since that is Table Name
        for index in 1..<cmdConvertCSV.table.count {
            let line = cmdConvertCSV.table[index]
            if let itemInfo = parseItemInfo(line: line) {
                self.itemInfos.append(itemInfo)
            } else {
                print ("[CmdDataItemInfo] [Desc=Bad Data] [lineNo=\(index + 1)]")
            }
        }

        result = .Success
    }

    private func parseItemInfo(line: [String]) -> ItemInfo? {
        let name = line[0]
        guard UInt(line[1]) != nil, let itemId = ItemId(rawValue: UInt(line[1])!) else {
            print ("[itemId] [\(line[1])]"); return nil
        }
        guard let itemType = ItemType(string: line[2]) else {
            print ("[itemType] [\(line[2])]"); return nil
        }
        let canSell = ((line[3].lowercased() == "yes") ? true: false)
        guard let sellPrice = Int(line[4]) else {
            print ("[sellPrice] [\(line[4])]"); return nil
        }
        guard let purchasePrice = Int(line[5]) else {
            print ("[purchasePrice] [\(line[5])]"); return nil
        }
        let buildingId = getBuildingId(text: line[6])
        guard let maxStack = Int(line[7]) else {
            print ("[maxStack] [\(line[7])]"); return nil
        }
        let textureName = line[8]

        return ItemInfo(itemId: itemId, itemType: itemType, name: name, textureName: textureName,
                        maxStack: maxStack,
                        canSell: canSell, sellPrice: sellPrice, purchasePrice: purchasePrice,
                        buildingId: buildingId)
    }

    private func getBuildingId(text: String) -> BuildingId? {
        if text.lowercased() == "null" || UInt(text) == nil {
            return nil
        }
        return BuildingId(rawValue: UInt(text)!)
    }
}
