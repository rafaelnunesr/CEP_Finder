//
//  MenuTableViewCell.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/12/21.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    // MARK: Identifier
    static let identifier: String = "MenuTableViewCell"
    
    // MARK: Nib
    static func nib() -> UINib {
        return UINib(nibName: MenuTableViewCell.identifier, bundle: nil)
    }
    
    // MARK: Components
    let cellLabel: UILabel = UILabel()

    // MARK: AwakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = Colors.lightOrange
        self.contentView.addSubview(self.cellLabel)
        self.setupCell()
    }

    // MARK: SetSelected
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: SetupCell
    private func setupCell() {
        self.cellLabel.textAlignment = .left
        self.cellLabel.translatesAutoresizingMaskIntoConstraints = false
        self.cellLabel.textColor = .white
        self.cellLabel.font = UIFont.recursiveMedium(size: 18)
        self.setupCellConstraints()
    }
    
    // MARK: SetupCellConstraints
    private func setupCellConstraints() {
        self.cellLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor).isActive = true
        self.cellLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20).isActive = true
        self.cellLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        self.cellLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor).isActive = true
    }
}
