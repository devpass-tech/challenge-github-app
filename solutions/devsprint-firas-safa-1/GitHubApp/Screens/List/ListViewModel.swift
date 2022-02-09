import Foundation

class ListViewModel {
    private var listItems: [String]
    
    init(listItems: [String] = []) {
        self.listItems = listItems
    }
    
    var rowCount: Int {
        listItems.count
    }
    
    func getItemFor(_ index: Int) -> String {
        listItems[index]
    }

    func getCellFor(_ index: Int) -> RepositoryCellViewConfiguration {
        let item = listItems[index]
        return RepositoryCellViewConfiguration(title: item, subtitle: item)
    }
}
