//
//  DetailViewController.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 03/11/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    let detailView = DetailView()
    let repository: Repository?
    
    init(repository: Repository) {
        self.repository = repository
        super.init(nibName: nil, bundle: nil)

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        self.view = detailView
    }
    
    override func viewDidLoad() {
        detailView.repositoryInfoView.updateView(with: RepositoryInfoViewConfiguration(repoTitle: repository?.name ?? "", repoDescription: repository?.description ?? "", stars: repository?.stargazersCount ?? 0, forks: repository?.forksCount ?? 0))
        detailView.ownerView.updateView(with: OwnerViewConfiguration(ownerTitle: "Owner", ownerName: repository?.owner?.login ?? "", ownerBio: repository?.owner?.type ?? "", ownerImage: UIImage(systemName: "person.fill")))
    }
}
