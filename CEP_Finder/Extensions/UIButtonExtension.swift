//
//  UIButtonExtension.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/15/21.
//

import UIKit

enum ButtonIcons: String {
    case home = "house.fill"
    case trash = "trash.fill"
    case emptyHeart = "suit.heart"
    case fullHeart = "suit.heart.fill"
    case menu = "line.horizontal.3"
    case search = "magnifyingglass"
}

extension UIButton {
    
    // MARK: ButtonDefaultSettings
    private func buttonDefaultSettings() {
        self.tintColor = .white
        self.contentMode = .scaleAspectFill
    }
    
    // MARK: ButtonWithIcon
    func buttonWithIcon(systemImage: ButtonIcons) {
        let btnImage = UIImage(systemName: systemImage.rawValue)
        self.setImage(btnImage, for: .normal)
        self.buttonDefaultSettings()
    }
    
    // MARK: HeartButton
    func heartButton() {
        self.setImage(UIImage(systemName: ButtonIcons.emptyHeart.rawValue), for: .normal)
        self.setImage(UIImage(systemName: ButtonIcons.fullHeart.rawValue), for: .selected)
        self.buttonDefaultSettings()
    }
    
}
