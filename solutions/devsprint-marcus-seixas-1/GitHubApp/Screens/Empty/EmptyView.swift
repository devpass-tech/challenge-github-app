//
//  EmptyView.swift
//  GitHubApp
//
//  Created by Rafael Mazzoco on 22/11/22.
//

import UIKit

struct EmptyViewConfiguration {

    var labelTitle: String
    var labelSubtitle: String
}
    

final class EmptyView: UIView{
    
    
// Este lugar é onde esta sendo escrito as caracteristicas do texto = titulo (tam, cor, etc)
    private var  titleLabel: UILabel = {
        let title = UILabel()
        title.font = UIFont.boldSystemFont(ofSize: 20)  //font size
        title.tintColor = .darkGray //font color
        title.autoresizesSubviews = true //
        title.translatesAutoresizingMaskIntoConstraints = false //
        title.text = "No repositories found"
        return title
    }()
    
// Este lugar é onde esta sendo escrito as caracteristicas do texto = subtitulo (tam, cor, etc)
    private var subtitleLabel: UILabel = {
        let subtitle = UILabel()
        subtitle.font = UIFont.boldSystemFont(ofSize: 14) //font size
        subtitle.tintColor = .gray //font color
        subtitle.autoresizesSubviews = true //
        subtitle.translatesAutoresizingMaskIntoConstraints = false //
        subtitle.text = "Search for users to see their public repositories here!"
        return subtitle
    }()
    
// Está sendo feita a inicializaçāo da view a partir daqui:
    
    override init(frame: CGRect = .zero) {
        super.init(frame: frame)
        buildHierarchy()
        setupConstraints()
        
        }
    
    required init?(coder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}

extension EmptyView: ViewCodable{
    
    // aonde está sendo falado a ordem dos componentes da tela
    func buildHierarchy() {
        addSubview(titleLabel)
        addSubview(subtitleLabel)
    }
    
    //está sendo passado as configurações de posicionamento
    func setupConstraints() {
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        
        subtitleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16).isActive = true
    }
    
    //
    func applyAdditionalChanges() {
        self.backgroundColor = .white
    }
    
    //
    func updateView(with configuration:  EmptyViewConfiguration) {
        titleLabel.text = configuration.labelTitle
        subtitleLabel.text = configuration.labelSubtitle
    }
}
