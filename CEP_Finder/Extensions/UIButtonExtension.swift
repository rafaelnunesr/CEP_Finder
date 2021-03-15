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
}

extension UIButton {
    
    // MARK: ButtonDefaultSettings
    private func buttonDefaultSettings() {
        self.contentMode = .scaleAspectFill
        self.tintColor = .white
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
