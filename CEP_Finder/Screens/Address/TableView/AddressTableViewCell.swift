//
//  AddressTableViewCell.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/14/21.
//

import UIKit

class AddressTableViewCell: UITableViewCell {
    
    static let identifier: String = "AddressTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: AddressTableViewCell.identifier, bundle: nil)
    }
    
    let cepLabel: AddressComponentCell = AddressComponentCell()
    let addressLabel: AddressComponentCell = AddressComponentCell()
    let favoriteButton: UIButton = UIButton()

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = Colors.ligherOrange
        self.setup()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    private func setup() {
        self.setupSubviews()
        self.setupComponents()
    }
    
    
    private func setupSubviews() {
        self.contentView.addSubview(self.cepLabel)
        self.contentView.addSubview(self.addressLabel)
        self.contentView.addSubview(self.favoriteButton)
    }
    
    private func setupComponents() {
        self.setupCepLabel()
        self.setupAddressLabel()
        self.setupFavoriteButton()
    }
    
    private func setupCepLabel() {
        
        cepLabel.titleLabel.text = "CEP"
        
        cepLabel.translatesAutoresizingMaskIntoConstraints = false
        cepLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 4).isActive = true
        cepLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 4).isActive = true
        cepLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -4).isActive = true
        cepLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true

    }
    
    private func setupAddressLabel() {
        addressLabel.titleLabel.text = "Address"
        
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.topAnchor.constraint(equalTo: cepLabel.bottomAnchor, constant: 4).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4).isActive = true
        addressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    private func setupFavoriteButton() {
        self.setupFavoriteButtonConstraints()
        self.favoriteButton.heartButton()
        self.favoriteButton.tintColor = .gray
        self.favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
    }
    
    // MARK: FavoriteButtonTapped
    @objc private func favoriteButtonTapped() {
        if self.favoriteButton.isSelected {
            self.favoriteButton.isSelected = false
        }else {
            self.favoriteButton.isSelected = true
        }
    }
    
    func setupFavoriteButtonConstraints() {
        let buttonSize: CGFloat = 30
        
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        favoriteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        favoriteButton.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
    }
}
