//
//  UIView+BorderBottom.swift
//  OnboardingChallenge
//
//  Created by Guilherme Strutzki on 19/11/21.
//

import Foundation
import UIKit

extension UIView {
    enum ViewSide {
        case Left, Right, Top, Bottom
    }

    func addBottomBorder(with color: UIColor?, andWidth borderWidth: CGFloat) {
        let border = UIView()
        border.backgroundColor = color
        border.autoresizingMask = [.flexibleWidth, .flexibleTopMargin]
        border.frame = CGRect(x: 0, y: frame.size.height - borderWidth, width: frame.size.width, height: borderWidth)
        addSubview(border)
    }
}
