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
            if let info = parseBuildingInfo(line: line) {
                self.buildingInfos.append(info)
            } else {
                print ("[CmdDataBuildingInfo] [Desc=Bad Data] [lineNo=\(index + 1)]")
            }
        }

        result = .Success
    }

    private func parseBuildingInfo(line: [String]) -> BuildingInfo? {
        return nil
    }
}
