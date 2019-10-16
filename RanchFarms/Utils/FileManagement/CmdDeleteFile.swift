import SpriteKit

class CmdDeleteFile: Command {
    // Input
    let directory: String
    let fileName: String
    let fileExtension: String

    // Output
    var success = false

    init(directory: String, fileName: String, fileExtension: String) {
        self.directory = directory
        self.fileName = fileName
        self.fileExtension = fileExtension
    }

    func execute() {
        let fileManager = FileManager.default

        do {
            // everything will exist under document directory
            let documentDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:true)

            var saveDirectoryUrl = documentDirectory
            if !directory.isEmpty {
                saveDirectoryUrl = documentDirectory.appendingPathComponent(directory, isDirectory: true)
            }

            let saveFileUrl = saveDirectoryUrl.appendingPathComponent(fileName, isDirectory: false).appendingPathExtension(fileExtension)

            if fileManager.fileExists(atPath: saveFileUrl.path) {
                try fileManager.removeItem(atPath: saveFileUrl.path)
                //print("[CmdDelete] [Desc=Successfully Deleted File] [path=\(saveFileUrl.absoluteString)]")
            }
        } catch {
            //print("[CmdDelete] [Desc=Failed to delete file] [BaseDirectory=\(directory)] [FileName=\(fileName).\(fileExtension)]")
            //print(error)
        }
    }
}
