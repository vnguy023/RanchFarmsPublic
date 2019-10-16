import SpriteKit

class CmdLoadFile: Command {
    // Input
    let directory: String
    let fileName: String
    let fileExtension: String

    // Output
    var text = ""
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

            text = try String(contentsOfFile: saveFileUrl.path, encoding: .utf8)

            //print("[CmdLoad] [Desc=Sucessfully loaded file] [Path=\(saveFileUrl.absoluteString)]")
            success = true
        } catch {
            //print("[CmdLoad] [Desc=Failed to Load File] [BaseDirectory=\(directory)] [FileName=\(fileName).\(fileExtension)]")
            //print(error)
        }
    }
}
