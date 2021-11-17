//
//  DetailViewController.swift
//  OnboardingChallenge
//
//  Created by Rodrigo Borges on 03/11/21.
//

import UIKit

class DetailViewController: UIViewController {
    // MARK: Properties
    private lazy var detailsView: DetailsView = {
        return DetailsView()
    }()
    
    // MARK: Outlets
    
    // MARK: Initializers
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    // MARK: Overrides
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = detailsView
    }
    
    // MARK: Actions
    
    // MARK: Methods
}
