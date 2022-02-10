import Foundation

struct SettingsViewModel {
    private let appVersion = Utils.appVersion
    private let header = "APP VERSTION"
    
    var rowCount: Int {
        1
    }
    
    func getCellFor(_ index: Int) -> String {
        "Version " + appVersion
    }
    
    func getHeaderFor(_ index: Int) -> String {
        header
    }
}
