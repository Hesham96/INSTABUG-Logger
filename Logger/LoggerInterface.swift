import Foundation

enum LogLevel {
    case Verbose
    case Error
}

protocol LoggerInterface {
    func fetch() -> [Log]
    func log(message:String,level:LogLevel) -> Bool
}
