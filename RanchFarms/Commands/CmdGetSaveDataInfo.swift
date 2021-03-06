import Foundation

class CmdGetSaveDataInfo: Command {
    let saveSlot: SaveSlot

    // Output
    var saveDataInfo: SaveDataInfo! = nil
    var result = Result.AwaitingExecution

    enum Result {
        case AwaitingExecution
        case Success

        case NoSaveFile
        case SaveFileNotCompatible
    }

    init(saveSlot: SaveSlot) {
        self.saveSlot = saveSlot
    }

    func execute() {
        let cmdLoadFile = CmdLoadFile(directory: Config.SaveDirectory, fileName: saveSlot.getFileName(), fileExtension: Config.SaveFileExtension)
        cmdLoadFile.execute()

        if !cmdLoadFile.success {
            result = .NoSaveFile
            return
        }

        let decoder = JSONDecoder()
        do {
            if let data = cmdLoadFile.text.data(using: .utf8) {
                saveDataInfo = try decoder.decode(SaveDataInfo.self, from: data)
            } else {
                result = .SaveFileNotCompatible
                return
            }
        } catch {
            result = .SaveFileNotCompatible
            return
        }

        result = .Success
    }
}
