// Copyright © 2021 DevPass. All rights reserved.

import UIKit

public final class ListViewController: UIViewController {
  // MARK: Outlets

  private lazy var listView: ListView = {
    return ListView()
  }()

  private lazy var settingsButton: UIBarButtonItem = {
    let button = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(self.showSettings))
    return button
  }()

  private lazy var searchController: UISearchController = {
    let searchController = UISearchController(searchResultsController: nil)
    searchController.delegate = self
    searchController.searchBar.delegate = self
    searchController.searchResultsUpdater = self
    searchController.searchBar.placeholder = "Type a GitHub user name"
    searchController.hidesNavigationBarDuringPresentation = false
    return searchController
  }()

  private let service = Service()

  // MARK: Initialization

  public init() {
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder _: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override public func loadView() {
    self.view = self.listView
  }

  override public func viewDidLoad() {
    super.viewDidLoad()
    self.setupUI()
    self.bindEvents()
    self.fetchList()
  }

  // MARK: Actions

  // insert action to settingsViewController here

  // MARK: Methods

  private func setupUI() {
    title = "Repositories"
    self.setupNavigationBar()
  }

  private func setupNavigationBar() {
    navigationController?.navigationBar.backgroundColor = .secondarySystemBackground
    navigationController?.navigationBar.prefersLargeTitles = true
    navigationItem.searchController = self.searchController
    navigationItem.hidesSearchBarWhenScrolling = false
    navigationItem.rightBarButtonItem = self.settingsButton
  }

  private func bindEvents() {
    // insert the callback for the tapped cell in ListView
  }

  private func fetchList() {
    self.service.fetchList { items in
      let configuration = ListViewConfiguration(listItems: items)
      self.listView.updateView(with: configuration)
    }
  }

  @objc private func showSettings() {
    navigationController?.present(
      SettingsViewController(interactor: SettingsInteractor(bundleService: Bundle.main)),
      animated: true
    )
  }
}

// MARK: Extensions

extension ListViewController: UISearchResultsUpdating, UISearchControllerDelegate, UISearchBarDelegate {
  public func updateSearchResults(for _: UISearchController) {}

  func searchBarButtonClicked(_: UISearchBar) {}
}
