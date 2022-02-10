import Foundation

struct SettingsViewModel {
    private let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    private let header = "APP VERSTION"
    
    var rowCount: Int {
        1
    }
    
    func getCellFor(_ index: Int) -> String {
        "Version " + (appVersion ?? "?")
    }
    
    func getHeaderFor(_ index: Int) -> String {
        header
    }
}
