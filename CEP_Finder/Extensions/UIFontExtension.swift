//
//  UIFontExtension.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/11/21.
//

import UIKit

// MARK: RecursiveFonts
enum RecursiveFonts: String {
    case black = "Recursive-Black"
    case bold = "Recursive-Bold"
    case light = "Recursive-Light"
    case medium = "Recursive-Medium"
    case regular = "Recursive-Regular"
}

extension UIFont {
    
    // MARK: RecursiveBlack
    static func recursiveBlack(size: CGFloat) -> UIFont {
        guard let recursive = UIFont(name: RecursiveFonts.black.rawValue, size: size) else {
            fatalError("Error loading Recursive-Black font.")
        }
        
        return recursive
    }
    
    // MARK: RecursiveBold
    static func recursiveBold(size: CGFloat) -> UIFont {
        guard let recursive = UIFont(name: RecursiveFonts.bold.rawValue, size: size) else {
            fatalError("Error loading Recursive-Bold font.")
        }
        
        return recursive
    }
    
    // MARK: RecursiveLight
    static func recursiveLight(size: CGFloat) -> UIFont {
        guard let recursive = UIFont(name: RecursiveFonts.light.rawValue, size: size) else {
            fatalError("Error loading Recursive-Light font.")
        }
        
        return recursive
    }
    
    // MARK: RecursiveMedium
    static func recursiveMedium(size: CGFloat) -> UIFont {
        guard let recursive = UIFont(name: RecursiveFonts.medium.rawValue, size: size) else {
            fatalError("Error loading Recursive-Medium font.")
        }
        
        return recursive
    }
    
    // MARK: RecursiveRegular
    static func recursiveRegular(size: CGFloat) -> UIFont {
        guard let recursive = UIFont(name: RecursiveFonts.regular.rawValue, size: size) else {
            fatalError("Error loading Recursive-Regular font.")
        }
        
        return recursive
    }

}
