//
//  UITableViewCell+Extensions.swift
//  GitHubApp
//
//  Created by Rodrigo Borges on 06/10/21.
//

import UIKit

extension UITableViewCell {

    class func classIdentifier() -> String {
        guard let className = String(describing: self).components(separatedBy: ".").last else {
            return ""
        }

        return className
    }
}
