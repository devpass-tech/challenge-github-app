//
//  DetailsViewController.swift
//  OnboardingChallenge
//
//  Created by Maíra Preto on 12/10/21.
//

import UIKit


class DetailViewController: UIViewController {

    private lazy var detailView: DetailView = {
        let detailView = DetailView()
        detailView.backgroundColor = .white
        return detailView
    }()

    private let service = Service()

    init() {
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {

        self.view = self.detailView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
