import Foundation

class CmdConvertCSV: Command {
    // Input
    let text: String

    // Output
    var table = [[String]]() // Format: [lineNo] [Column]
    var result = Result.AwaitingExecution

    enum Result {
        case AwaitingExecution
        case Success
        case BadData
    }

    init(text: String) {
        self.text = text
    }

    func execute() {
        let lines = text.split{$0 == "\n"}.map(String.init)
        for line in lines {
            if line.isEmpty || line.lowercased().contains("#note") {
                table.append([String]())
            } else {
                table.append(line.split{$0 == ","}.map(String.init))
            }
        }
        result = .Success
    }
}
