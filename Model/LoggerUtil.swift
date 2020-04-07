import Foundation

class LoggerUtil {
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("Log")
    
    static func save(_ items: [Log]?) {
        if items != nil {
            do {
                let data = try NSKeyedArchiver.archivedData(withRootObject: items!, requiringSecureCoding: false)
                try data.write(to: ArchiveURL)
            } catch {
                print("Couldn't read file.")
            }
        }
    }
    
    static func load() -> [Log]? {
        if let nsData = NSData(contentsOf: ArchiveURL) {
            do {
                
                let data = Data(referencing:nsData)
                
                if let loaded = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? [Log] {
                    return loaded
                }
            } catch {
                print("Couldn't read file.")
                return nil
            }
        }
        return nil
        
    }
    
    static func removeLogs() {
        LoggerUtil.save([])
    }
}

