import Foundation

class CmdDataTileInfo: CmdDataBase {
    // Output
    var tileInfos = [TileInfo]()

    init() {
        super.init(fileName: "TileInfo")
    }

    override func execute() {
        super.execute()
        if result != .AwaitingExecution { return }

        // Skipping line one since that is Table Name
        for index in 1..<table.count {
            let line = table[index]
            if line.isEmpty { continue }
            
            if let info = parseTileInfo(line: line) {
                self.tileInfos.append(info)
            } else {
                print ("[CmdDataTileInfo] [Desc=Bad Data] [lineNo=\(index + 1)]")
            }
        }

        result = .Success
    }

    private func parseTileInfo(line: [String]) -> TileInfo? {
        let name = line[0]
        guard let tileId = getTileId(text: line[1]) else {
            print ("[tileId] [\(line[1])]"); return nil
        }
        guard let tileType = TileType(string: line[2]) else {
            print ("[tileType] [\(line[2])]"); return nil
        }
        let isBlocking = getBool(text: line[3])
        let hasSpriteIndices = getBool(text: line[4])
        let textureName = line[5]

        return TileInfo(tileId: tileId, tileType: tileType, hasSpriteIndices: hasSpriteIndices, isBlocking: isBlocking, name: name, textureName: textureName)
    }
}
