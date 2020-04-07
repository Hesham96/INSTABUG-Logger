import Foundation

class Log {
    var level:LogLevel
    var message:String
    var date:Date
    var encodedLog:String?
    
    required init(level:LogLevel , message:String, date:Date,encodedMessage: String = "") {
        self.level = level
        self.message = message
        self.date = date
        self.encodedLog = encodeLog(date: Date(), level: level, message: self.message)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(level, forKey: "level")
        let validatedMsg = validateMessage(message: message)
        aCoder.encode(validatedMsg, forKey: "message")
        aCoder.encode(date, forKey: "date")
        aCoder.encode(encodedLog, forKey: "encodedLog")
    }
    
    required init?(coder aDecoder: NSCoder) {
        level = aDecoder.decodeObject(forKey: "level") as? LogLevel ?? LogLevel.Verbose
        message = aDecoder.decodeObject(forKey: "message") as? String ?? ""
        date = aDecoder.decodeObject(forKey: "date") as? Date ?? Date()
        encodedLog = aDecoder.decodeObject(forKey: "encodedLog") as? String ?? ""
    }

    
    func encodeLog(date:Date,level:LogLevel,message:String) ->  String {
        return "[\(date)-\(level)-\(message)]"
    }
    func validateMessage(message:String) -> String {
        var dottedMessage = ""
        dottedMessage = message.count > 1000 ? message.prefix(1000) + "..." : message
        return dottedMessage
    }
}
