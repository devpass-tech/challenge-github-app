//
//  SettingsCell.swift
//  OnboardingChallenge
//
//  Created by Strawberry Pie on 12/14/21.
//

import UIKit

class SettingsCell: UITableViewCell {
    static let Identifier = "SettingsCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(model: SettingsModel) {
        
    }
}

struct SettingsModel {
    var version: String
}
