//
//  Service.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 30/09/21.
//

import Foundation

protocol ServiceProtocol {
    func fetchList(_ completion: ([RepositoryCellViewConfiguration]) -> Void)
}

struct Service: ServiceProtocol {
    func fetchList(_ completion: ([RepositoryCellViewConfiguration]) -> Void) {
        completion([
            RepositoryCellViewConfiguration(name: "Renato Sarro", description: "Renato Sarro"),
            RepositoryCellViewConfiguration(name: "Hack Amanda", description: "Hack Amanda"),
            RepositoryCellViewConfiguration(name: "Gabriel Barbosa", description: "Gabriel Barbosa"),
            RepositoryCellViewConfiguration(name: "Tatiana Rico", description: "Tatiana Rico"),
            RepositoryCellViewConfiguration(name: "Thyago Raphael", description: "Thyago Raphael"),
            RepositoryCellViewConfiguration(name: "Vinicius Rodrigues", description: "Vinicius Rodrigues"),
            RepositoryCellViewConfiguration(name: "Mariana Lima", description: "Mariana Lima"),
            RepositoryCellViewConfiguration(name: "Renato Sarro", description: "Renato Sarro"),
            RepositoryCellViewConfiguration(name: "Hack Amanda", description: "Hack Amanda"),
            RepositoryCellViewConfiguration(name: "Gabriel Barbosa", description: "Gabriel Barbosa"),
            RepositoryCellViewConfiguration(name: "Tatiana Rico", description: "Tatiana Rico"),
            RepositoryCellViewConfiguration(name: "Thyago Raphael", description: "Thyago Raphael"),
            RepositoryCellViewConfiguration(name: "Vinicius Rodrigues", description: "Vinicius Rodrigues"),
            RepositoryCellViewConfiguration(name: "Mariana Lima", description: "Mariana Lima"),
        ])
    }
}
