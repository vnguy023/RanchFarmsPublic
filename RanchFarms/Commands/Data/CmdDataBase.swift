import Foundation

class CmdDataBase: Command {
    // Output
    var result = Result.AwaitingExecution

    // Internal
    private var text = ""
    private var fileName: String
    private var cmdConvertCSV: CmdConvertCSV! = nil
    var table: [[String]] {get {return cmdConvertCSV.table} }

    enum Result {
        case AwaitingExecution
        case Success

        case NoFile
        case BadFile
    }

    init(fileName: String) {
        self.fileName = fileName
    }

    func execute() {
        do {
            if let path = Bundle.main.path(forResource: fileName, ofType: "csv") {
                try text = String(contentsOfFile: path, encoding: .utf8)
            } else {
                result = .NoFile
                return
            }
        } catch {
            result = .NoFile
            return
        }

        cmdConvertCSV = CmdConvertCSV(text: text)
        cmdConvertCSV.execute()

        if cmdConvertCSV.result != .Success {
            result = .BadFile
            return
        }
    }

    func getItemId(text: String) -> ItemId? {
        if text.lowercased() == "null" || UInt(text) == nil {
            return nil
        }
        return ItemId(rawValue: UInt(text)!)
    }

    func getBuildingId(text: String) -> BuildingId? {
        if text.lowercased() == "null" || UInt(text) == nil {
            return nil
        }
        return BuildingId(rawValue: UInt(text)!)
    }

    func getCGFloat(text: String) -> CGFloat? {
        guard let n = NumberFormatter().number(from: text) else {return nil}
        return CGFloat(truncating: n)
    }

    func getBool(text: String) -> Bool {
        if text.lowercased() == "yes" {
            return true
        }
        return false
    }
}
