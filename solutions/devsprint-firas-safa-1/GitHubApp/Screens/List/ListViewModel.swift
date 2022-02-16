import Foundation

struct ListViewModel {
    private var listItems: [RepositoryModel]
    
    var rowCount: Int {
        listItems.count
    }
    
    init(listItems: [RepositoryModel] = []) {
        self.listItems = listItems
    }
    
    func getItemFor(_ index: Int) -> RepositoryModel {
        listItems[index]
    }

    func getCellFor(_ index: Int) -> RepositoryCellViewConfiguration {
        let item = listItems[index]
        return RepositoryCellViewConfiguration(title: item.name, subtitle: item.username)
    }
}
