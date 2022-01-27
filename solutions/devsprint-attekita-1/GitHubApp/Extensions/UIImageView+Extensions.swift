//
//  UIImageView+Extensions.swift
//  GitHubApp
//
//  Created by Giovanna Moeller on 19/01/22.
//

import Foundation
import UIKit

extension UIImageView {
  
  func makeItRounded() {
    self.layer.cornerRadius = self.frame.size.height / 2
    self.layer.masksToBounds = true
    self.clipsToBounds = true
  }
  
}
