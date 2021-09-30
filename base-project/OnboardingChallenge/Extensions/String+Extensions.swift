//
//  String+Extensions.swift
//  OnboardingChallenge
//
//  Created by Rodrigo Borges on 06/10/21.
//

import Foundation

extension String {

    func removingSpaces() -> String {

        return self.replacingOccurrences(of: " ", with: "")
    }
}
