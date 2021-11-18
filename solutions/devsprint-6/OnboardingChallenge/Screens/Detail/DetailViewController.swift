//
//  DetailViewController.swift
//  OnboardingChallenge
//
//  Created by Rodrigo Borges on 03/11/21.
//

import UIKit

class DetailViewController: UIViewController {
 
    // MARK: Components
    
    private lazy var ownerView: OwnerView = {
        OwnerView()
    }()
    
    // MARK: Initializers
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecyle
    override func viewDidLoad() {
        super.viewDidLoad()
        ownerView.updateView(with: OwnerViewConfiguration(ownerName: "Finn",
                                                          ownerJobTitle: "iOS Software Engineer",
                                                          onwerImage: UIImage(named: "finn")))
    }
    
    override func loadView() {
        view = ownerView
    }
    
}
