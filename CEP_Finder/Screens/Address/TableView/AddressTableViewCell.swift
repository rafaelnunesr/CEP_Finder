//
//  AddressTableViewCell.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/14/21.
//

import UIKit

class AddressTableViewCell: UITableViewCell {
    
    static let identifier: String = "AddressTableViewCell"
    
    // MARK: Nib
    static func nib() -> UINib {
        return UINib(nibName: AddressTableViewCell.identifier, bundle: nil)
    }
    
    // MARK: Components
    private(set) var cepLabel: AddressComponentCell!
    private(set) var addressLabel: AddressComponentCell!

    // MARK: AwakeFromNib
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = Colors.ligherOrange
        self.setup()
    }

    // MARK: SetSelected
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: Setup
    private func setup() {
        self.initializeComponents()
        self.setupSubviews()
        self.setupComponents()
    }
    
    // MARK: InitializeComponents
    private func initializeComponents() {
        self.cepLabel = AddressComponentCell()
        self.addressLabel = AddressComponentCell()
    }
    
    // MARK: SetupSubviews
    private func setupSubviews() {
        self.contentView.addSubview(self.cepLabel)
        self.contentView.addSubview(self.addressLabel)
    }
    
    // MARK: SetupComponents
    private func setupComponents() {
        self.setupCepLabel()
        self.setupAddressLabel()
    }
    
    // MARK: SetupCepLabel
    private func setupCepLabel() {
        cepLabel.titleLabel.text = "CEP"
        cepLabel.translatesAutoresizingMaskIntoConstraints = false
        cepLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 4).isActive = true
        cepLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 4).isActive = true
        cepLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -4).isActive = true
        cepLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true

    }
    
    // MARK: SetupAddressLabel
    private func setupAddressLabel() {
        addressLabel.titleLabel.text = "Address"
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.topAnchor.constraint(equalTo: cepLabel.bottomAnchor, constant: 4).isActive = true
        addressLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4).isActive = true
        addressLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4).isActive = true
        addressLabel.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
}
