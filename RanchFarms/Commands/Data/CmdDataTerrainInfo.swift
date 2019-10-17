import Foundation

class CmdDataTerrainInfo: CmdDataBase {
    // Output
    var terrainInfos = [TerrainInfo]()

    init() {
        super.init(fileName: "TerrainInfo")
    }

    override func execute() {
        super.execute()
        if result != .AwaitingExecution { return }

        // Skipping line one since that is Table Name
        for index in 1..<table.count {
            let line = table[index]
            if line.isEmpty { continue }
            
            if let info = parseTerrainInfo(line: line) {
                self.terrainInfos.append(info)
            } else {
                print ("[CmdDataTerrainInfo] [Desc=Bad Data] [lineNo=\(index + 1)]")
            }
        }

        result = .Success
    }

    private func parseTerrainInfo(line: [String]) -> TerrainInfo? {
        let name = line[0]
        guard let terrainType = TerrainType(string: line[1]) else {
            print ("[terrainType] [\(line[1])]"); return nil
        }
        let isBlocking = getBool(text: line[2])
        let hasSpriteIndices = getBool(text: line[3])
        let textureName = line[4]

        return TerrainInfo(terrainType: terrainType, hasSpriteIndices: hasSpriteIndices, isBlocking: isBlocking, name: name, textureName: textureName)
    }
}
