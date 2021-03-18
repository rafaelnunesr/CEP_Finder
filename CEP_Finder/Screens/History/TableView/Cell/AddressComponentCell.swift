//
//  AddressComponentCell.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/14/21.
//

import UIKit

class AddressComponentCell: UIView {
    
    let titleLabel: UILabel = UILabel()
    let label: UILabel = UILabel()

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.setupSubviews()
        self.setupComponents()
    }
    
    private func setupSubviews() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.label)
    }
    
    private func setupComponents() {
        self.setupTitleLabel()
        self.setupLabel()
    }
    
    private func setupTitleLabel() {
        
        self.titleLabel.textColor = .gray
        self.titleLabel.font = UIFont.recursiveRegular(size: 12)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    private func setupLabel() {
     
        self.label.textColor = .darkGray
        self.label.font = UIFont.recursiveMedium(size: 15)
        self.label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
}
