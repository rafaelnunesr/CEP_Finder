//
//  FooterViewConstraints.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/15/21.
//

import UIKit

extension FooterView {
    
    // MARK: SetupFavoriteButtonConstraints
    func setupFavoriteButtonConstraints() {
        let buttonSize: CGFloat = 30
        
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        favoriteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        favoriteButton.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
    }
    
    // MARK: SetupAddressViewConstraints
    func setupAddressViewConstraints() {
        addressView.translatesAutoresizingMaskIntoConstraints = false
        addressView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        addressView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        addressView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50).isActive = true
        addressView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    // MARK: SetupCityStateConstraints
    func setupCityStateConstraints() {
        cityStateView.translatesAutoresizingMaskIntoConstraints = false
        cityStateView.topAnchor.constraint(equalTo: addressView.bottomAnchor, constant: 4).isActive = true
        cityStateView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        cityStateView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -50).isActive = true
        cityStateView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}
