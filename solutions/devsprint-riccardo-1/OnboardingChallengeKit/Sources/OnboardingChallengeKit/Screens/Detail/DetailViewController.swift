// Copyright © 2021 DevPass. All rights reserved.

import UIKit

class DetailViewController: UIViewController {
    // MARK: Properties
    private lazy var detailView: DetailView = {
        return DetailView()
    }()
    
    // MARK: Initialization
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func loadView() {
        view = detailView
    }
    
    // MARK: Actions
    
    // MARK: Methods
}
