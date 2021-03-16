//
//  UITextFieldExtension.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/11/21.
//

import UIKit

extension UITextField {
    
    // MARK: RightPadding
    @discardableResult
    func applyRightPadding() -> UIView {
        let padding = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
        self.leftView = padding
        self.leftViewMode = .always
        return padding
    }
    
}
