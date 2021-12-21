// Copyright © 2021 DevPass. All rights reserved.

import UIKit

final class ListViewController: UIViewController {
  private lazy var listView: ListView = {
    return ListView()
  }()

  private let service = Service()

  init() {
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    self.view = self.listView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    self.fetchList()
  }

  private func fetchList() {
    self.service.fetchList { items in
      let configuration = ListViewConfiguration(listItems: items)

      self.listView.updateView(with: configuration)
    }
  }
}
