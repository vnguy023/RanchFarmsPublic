import Foundation

class CmdDataItemInfo: CmdDataBase {
    // Output
    var itemInfos = [ItemInfo]()

    init() {
        super.init(fileName: "ItemInfo")
    }

    override func execute() {
        super.execute()
        if result != .AwaitingExecution { return }

        // Skipping line one since that is Table Name
        for index in 1..<table.count {
            let line = table[index]
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
        guard let itemId = getItemId(text: line[1]) else {
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
}
