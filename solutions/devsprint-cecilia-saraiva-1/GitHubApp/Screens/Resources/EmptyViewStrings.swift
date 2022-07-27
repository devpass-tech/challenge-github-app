
import Foundation

enum EmptyViewString: String {
    
    case labelTitle
    case labelSubtitle
    
    var localized: String {
            return self.rawValue.localized(tableName: "EmptyViewStrings")
    }
}
