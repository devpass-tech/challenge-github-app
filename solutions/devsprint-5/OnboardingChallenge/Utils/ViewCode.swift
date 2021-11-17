//
//  ViewCode.swift
//  OnboardingChallenge
//
//  Created by Guilherme Strutzki on 10/11/21.
//

import Foundation

protocol ViewCode {
  func buildViewHierarchy()
  func addConstraints()
  func additionalConfiguration()
  func setup()
}
extension ViewCode {
  func setup() {
    buildViewHierarchy()
    addConstraints()
    additionalConfiguration()
  }
}
