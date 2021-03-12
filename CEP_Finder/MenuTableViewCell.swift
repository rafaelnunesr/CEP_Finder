//
//  MenuTableViewCell.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/12/21.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    static let identifier: String = "MenuTableViewCell"
    
    let cellLabel: UILabel = UILabel()
    
    static func nib() -> UINib {
        return UINib(nibName: MenuTableViewCell.identifier, bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.superview?.addSubview(self.cellLabel)
        self.setupCell()
    
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setupCell() {
        self.cellLabel.translatesAutoresizingMaskIntoConstraints = false
        
        guard let _superview = superview else { return }
        self.cellLabel.topAnchor.constraint(equalTo: _superview.topAnchor).isActive = true
        self.cellLabel.leadingAnchor.constraint(equalTo: _superview.leadingAnchor).isActive = true
        self.cellLabel.trailingAnchor.constraint(equalTo: _superview.trailingAnchor).isActive = true
        self.cellLabel.bottomAnchor.constraint(equalTo: _superview.bottomAnchor).isActive = true
    }
}
