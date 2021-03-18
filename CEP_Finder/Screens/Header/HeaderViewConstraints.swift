//
//  HeaderViewExtension.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/15/21.
//

import Foundation

extension HeaderView {
    
    // MARK: SetupHomeButtonConstraints
    func setupHomeButtonConstraints() {
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        homeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        homeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        homeButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    // MARK: SetupTitleLabelConstraints
    func setupTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: homeButton.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    // MARK: SetupClearHistoryButtonConstraints
    func setupClearHistoryButtonConstraints() {
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        clearButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
        clearButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        clearButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
