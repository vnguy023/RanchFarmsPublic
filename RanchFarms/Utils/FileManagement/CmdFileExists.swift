import SpriteKit

class CmdFileExists: Command {
    // Input
    let directory: String
    let fileName: String
    let fileExtension: String

    // Output
    var fileExists = false

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
                fileExists = true
            }
        } catch {
            //print("[CmdFileExists] [Desc=Failed check if file exists] [BaseDirectory=\(directory)] [FileName=\(fileName).\(fileExtension)]")
            //print(error)
        }
    }
}
