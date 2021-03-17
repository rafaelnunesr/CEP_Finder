//
//  AddressFieldViewConstraints.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/15/21.
//

import Foundation

extension AddressFieldView {
    
    // MARK: SetupTitleLabelConstraints
    func setupTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    // MARK: SetupLabelConstraints
    func setupLabelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
}
