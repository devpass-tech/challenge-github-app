//
//  BundleService.swift
//  OnboardingChallenge
//
//  Created by Strawberry Pie on 12/14/21.
//

import Foundation

protocol BundleService {
    func object(forInfoDictionaryKey: String) -> Any?
}

extension Bundle: BundleService { }
