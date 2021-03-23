//
//  AboutViewControllerConstraints.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/20/21.
//

import Foundation

extension AboutViewController {
    
    // MARK: SetupAboutLabelConstraints
    func setupAboutLabelConstraints() {
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        aboutLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        aboutLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        aboutLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
    }
    
    // MARK: SetupDismissButtonConstraints
    func setupDismissButtonConstraints() {
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 4).isActive = true
        dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        dismissButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        dismissButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
    }
    
}
