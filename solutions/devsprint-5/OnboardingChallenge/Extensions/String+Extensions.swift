//
//  String+Extensions.swift
//  OnboardingChallenge
//
//  Created by Rodrigo Borges on 06/10/21.
//

import Foundation

extension String {

    static func repositoryInfo(starsCount: Int, bifurcationsCount: Int) -> String {

        return "\(starsCount) stars   \(bifurcationsCount) bifurcations"
    }
}
