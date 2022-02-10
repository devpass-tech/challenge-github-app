import Foundation

struct ListViewModel {
    private var listItems: [String]
    
    var rowCount: Int {
        listItems.count
    }
    
    init(listItems: [String] = []) {
        self.listItems = listItems
    }
    
    func getItemFor(_ index: Int) -> String {
        listItems[index]
    }

    func getCellFor(_ index: Int) -> RepositoryCellViewConfiguration {
        let item = listItems[index]
        return RepositoryCellViewConfiguration(title: item, subtitle: item)
    }
}
