
import Foundation

public class Logger :LoggerInterface{
    
    //MARK: Singleton
    static let shared = Logger()
    
    var logCounter = 0
    var sessionLimit = 5000
    
    
    init() {
        //MARK: Remove All Logs when being initialized
        LoggerUtil.removeLogs()
    }
    
    func fetch() -> [Log]{
        var sortedLogs:[Log]?
        sortedLogs = LoggerUtil.load()?.sorted(by: { (prev, current) -> Bool in
            prev.date < current.date
        })
        LoggerUtil.save(sortedLogs)
        return sortedLogs ?? []
    }
    
    func log(message: String, level: LogLevel) -> Bool {
        while logCounter < sessionLimit {
            let sortedLogs = fetch()
            self.logCounter += 1
            LoggerUtil.save(sortedLogs)
            return true
        }
        return false
    }
    
    
}

