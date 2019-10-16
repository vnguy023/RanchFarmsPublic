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
        // Validate the data
        if UInt(line[1]) == nil || ItemId(rawValue: UInt(line[1])!) == nil { print ("[itemId] [\(line[1])]"); return nil }
        if ItemType(string: line[2]) == nil { print ("[itemtype] [\(line[2])]"); return nil }
        if Int(line[4]) == nil { print ("[sellprice] [\(line[4])]"); return nil }
        if Int(line[5]) == nil { print ("[purchasePrice] [\(line[5])]"); return nil }
        if line[6] != "null" && BuildingId(rawValue: UInt(line[6])!) == nil { print ("[buildingId] [\(line[6])]"); return nil }
        if Int(line[7]) == nil { print ("[maxStack] [\(line[7])]"); return nil }

        return ItemInfo(itemId: ItemId(rawValue: UInt(line[1])!)!,
                        itemType: ItemType(string: line[2])!,
                        name: line[0],
                        textureName: line[8],
                        maxStack: Int(line[7])!,
                        canSell: ((line[3] == "yes") ? true: false),
                        sellPrice: Int(line[4])!,
                        purchasePrice: Int(line[5])!,
                        buildingId: (line[6] == "null" ? nil : BuildingId(rawValue: UInt(line[6])!)!))
    }
}
