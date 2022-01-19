//
//  ListViewCell.swift
//  GitHubApp
//
//  Created by Rogerio Cardoso Filho on 18/01/22.
//

import UIKit

class RepositoryCellView : UITableViewCell {
    
    /* **************************************************************************************************
    **
    **  MARK: Variables Declaration
    **
    ****************************************************************************************************/
    
    var repositoryLabel : UILabel!
    
    var nameLabel : UILabel!
    
    /* **************************************************************************************************
    **
    **  MARK: Init
    **
    ****************************************************************************************************/
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let width = UIScreen.main.bounds.width
        
        let height = UIScreen.main.bounds.height
        
        self.backgroundColor = UIColor.clear
        
        self.selectionStyle = .none
        
        //------------------- repository label ------------------------------------
        
        repositoryLabel = UILabel(frame: CGRect(x: width*0.05, y: height*0.02, width: width*0.7, height: 20))
        repositoryLabel.textColor = UIColor.black
        repositoryLabel.font = UIFont.boldSystemFont(ofSize: 16)
        repositoryLabel.lineBreakMode = .byTruncatingTail
        repositoryLabel.numberOfLines = 1
        contentView.addSubview(repositoryLabel)
        
        //------------------- name label ------------------------------------
        
        nameLabel = UILabel(frame: CGRect(x: width*0.05, y: 0, width: width*0.7, height: 20))
        nameLabel.textColor = UIColor.gray
        nameLabel.font = UIFont.systemFont(ofSize: 14)
        nameLabel.frame.origin.y = repositoryLabel.frame.origin.y + repositoryLabel.frame.height
        contentView.addSubview(nameLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        repositoryLabel.text = nil
        
    }
    
}
