import Foundation

class CmdDataBuildingInfo: CmdDataBase {
    // Output
    var buildingInfos = [BuildingInfo]()

    init() {
        super.init(fileName: "BuildingInfo")
    }

    override func execute() {
        super.execute()
        if result != .AwaitingExecution { return }

        // Skipping line one since that is Table Name
        for index in 1..<table.count {
            let line = table[index]
            if line.isEmpty { continue }

            if let info = parseBuildingInfo(line: line) {
                self.buildingInfos.append(info)
            } else {
                print ("[CmdDataBuildingInfo] [Desc=Bad Data] [lineNo=\(index + 1)]")
            }
        }

        result = .Success
    }

    private func parseBuildingInfo(line: [String]) -> BuildingInfo? {
        let name = line[0]
        guard let buildingId = getBuildingId(text: line[1]) else {
            print ("[buildingId] [\(line[1])]"); return nil
        }
        guard let buildingType = BuildingType(string: line[2]) else {
            print ("[buildingType] [\(line[2])]"); return nil
        }

        guard let objSizeWidth = getCGFloat(text: line[3]) else {
            print ("[objSizeWidth] [\(line[3])]"); return nil
        }
        guard let objSizeHeight = getCGFloat(text: line[4]) else {
            print ("[objSizeHeight] [\(line[4])]"); return nil
        }
        let objSize = CGSize(width: objSizeWidth, height: objSizeHeight)

        let isBlocking = getBool(text: line[5])
        let hasSpriteIndices = getBool(text: line[6])
        let harvestItemId = getItemId(text: line[7])
        let harvestDate = Int(line[8])

        return BuildingInfo(buildingId: buildingId, buildingType: buildingType,
                            objSize: objSize, isBlocking: isBlocking,
                            hasSpriteIndices: hasSpriteIndices,
                            name: name,
                            harvestDate: harvestDate, harvestItemId: harvestItemId)
    }
}
