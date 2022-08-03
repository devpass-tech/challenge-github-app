
import Foundation

enum EmptyViewString: String {
    
    case emptyViewTitle
    case emptyViewSubtitle
    
    var localized: String {
        return self.rawValue.localized(tableName: "EmptyViewStrings")
    }
}
