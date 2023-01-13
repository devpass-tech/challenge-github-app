
import Foundation
import UIKit

class RepositoryCellView: UITableView = {
    let tableView = UITableView(frame: .zero, style: .plain)
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.separatorStyle = .none
    tableView.delegate = self
    tableView.dataSource = self
    
  
    return tableView()
}()
 
override func viewDidLoad() {
    super.viewDidLoad()
    self.view.addSubview(self.tableView)
}

private func configContraints(){
    
    NSLayoutConstraint.activate([
        
        self.tableView.topAnchor.constraint(equalTo: self.view?.topAnchor),
        self.tableView.leadingAnchor.constraint(equalTo: self.view?.leadingAnchor),
        self.tableView.trailingAnchor.constraint(equalTo: self.view?.trailingAnchor),
        self.tableView.bottomAnchor.constraint(equalTo: self.view?.bottomAnchor)
    ])
}

extension UITableView: UITableViewDelegate, UITableViewDataSource{
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Na hora de fazer o identifier, foi dito que não serve para esse protocolo
        let cell = tableView.dequeueReusableCell(withIdentifier: <#T##String#>)
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
