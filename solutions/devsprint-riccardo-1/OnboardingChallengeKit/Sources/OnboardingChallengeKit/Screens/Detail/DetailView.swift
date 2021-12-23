//
//  DetailView.swift
//  
//
//  Created by Mateus Nazário Coelho on 23/12/21.
//

import UIKit

final class DetailView: UIView {
    // MARK: Outlets
    private lazy var licenseView: LicenseView = {
        let licenseView = LicenseView()
        licenseView.translatesAutoresizingMaskIntoConstraints = false
        return licenseView
    }()
    
    // MARK: Initialization
    init() {
        super.init(frame: .zero)
        setupViews()
        setupLicenseView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Methods
    private func setupViews() {
        configureSubViews()
        configureSubviewsConstraints()
        configureAdditionalBehaviors()
    }
    
    private func configureSubViews() {
        addSubview(licenseView)
    }
    
    private func configureSubviewsConstraints() {
        NSLayoutConstraint.activate([
            self.licenseView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.licenseView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.licenseView.topAnchor.constraint(equalTo: self.topAnchor)
        ])
    }
    
    private func configureAdditionalBehaviors() {
        backgroundColor = .white
    }
    
    private func setupLicenseView() {
    }
}

#if DEBUG
  import SwiftUI
  // swiftlint:disable type_name
  struct DetailView_Preview: PreviewProvider {
    static var previews: some View {
      return SwiftUIPreView { _ in
        let dv = DetailView()
        return dv
      }
    }
  }
  // swiftlint:enable type_name
#endif
