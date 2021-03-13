//
//  FooterView.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/13/21.
//

import UIKit

class FooterView: UIView, UpdateInfo {
    
    func updateView(address: Address) {
        print("%%%%%%%%%%%%%%%%%%%")
    }
    
    

    let myLeadingAnchor: CGFloat = 20
    let myTrailingAnchor: CGFloat = -50
    
    private let favoriteButton: UIButton = UIButton()
    private let addressView: AddressFieldView = AddressFieldView()
    private let cityStateView: AddressFieldView = AddressFieldView()
//    let addressLabel: UILabel = UILabel()
//    let address: UILabel = UILabel()
//    let cityStateLabel: UILabel = UILabel()
//    let cityState: UILabel = UILabel()
    
    var address: String?
    var cityState: String?
    
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
        self.addSubview(self.favoriteButton)
        self.addSubview(self.addressView)
        self.addSubview(self.cityStateView)
//        self.addSubview(self.addressLabel)
//        self.addSubview(self.address)
//        self.addSubview(self.cityStateLabel)
//        self.addSubview(self.cityState)
    }
    
    private func setupComponents() {
        self.setupFavoriteButton()
        self.setupAddressView()
        self.setupStateCityView()
//        self.setupAddressLabel()
//        self.setupAddress()
//        self.setupCityLabel()
//        self.setupCityState()
    }
    
    private func setupFavoriteButton() {
        
        self.favoriteButton.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        self.favoriteButton.setImage(UIImage(systemName: "suit.heart.fill"), for: .selected)
        self.favoriteButton.tintColor = .white
        self.favoriteButton.imageView?.contentMode = .scaleAspectFill
        
        self.favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        
        self.setupFavoriteButtonConstraints()
    }
    
    @objc private func favoriteButtonTapped() {
        if self.favoriteButton.isSelected {
            self.favoriteButton.isSelected = false
        }else {
            self.favoriteButton.isSelected = true
        }
    }
    
    private func setupAddressView() {
        self.addressView.address?.title = AddressSearchResult.streetTitle
        self.addressView.address?.addressInfo = self.address ?? ""
        self.addressView.setup()
        self.setupAddressViewConstraints()
        self.addressView.backgroundColor = .yellow
    }
    
    private func setupStateCityView() {
        self.cityStateView.address = AddressField(title: AddressSearchResult.stateCityTitle, addressInfo: self.address ?? "")
        self.cityStateView.setup()
        self.setupCityStateConstraints()
        self.cityStateView.backgroundColor = .green
    }
    
//    private func setupAddressLabel() {
//        self.addressLabel.text = "Street / Avenue"
//        self.addressLabel.textColor = .black
//        self.addressLabel.font = UIFont.recursiveRegular(size: 15)
//
//        setupAddressLabelConstraints()
//    }
    
//    private func setupAddress() {
//
//        self.address.text = "No valid CEP provied"
//        self.address.textColor = .white
//        self.address.font = UIFont.recursiveMedium(size: 20)
//
//        setupAddressConstraints()
//    }
//
//    private func setupCityLabel() {
//        self.cityStateLabel.text = "City / State"
//        self.cityStateLabel.textColor = .black
//        self.cityStateLabel.font = UIFont.recursiveRegular(size: 15)
//
//        setupCityStateLabelConstraints()
//    }
//
//    private func setupCityState() {
//        self.cityState.text = "No valid CEP provied"
//        self.cityState.textColor = .white
//        self.cityState.font = UIFont.recursiveMedium(size: 20)
//
//        setupCityStateConstraints()
//
//    }
}

extension FooterView {
    
    func setupFavoriteButtonConstraints() {
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        favoriteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        favoriteButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    func setupAddressViewConstraints() {
        addressView.translatesAutoresizingMaskIntoConstraints = false
        addressView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        addressView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: myLeadingAnchor).isActive = true
        addressView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: myTrailingAnchor).isActive = true
        addressView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    func setupCityStateConstraints() {
        cityStateView.translatesAutoresizingMaskIntoConstraints = false
        cityStateView.topAnchor.constraint(equalTo: addressView.bottomAnchor, constant: 4).isActive = true
        cityStateView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: myLeadingAnchor).isActive = true
        cityStateView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: myTrailingAnchor).isActive = true
        cityStateView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
//    func setupAddressLabelConstraints() {
//        addressLabel.translatesAutoresizingMaskIntoConstraints = false
//        addressLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
//        addressLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
//        addressLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
//    }
//
//    func setupAddressConstraints() {
//        address.translatesAutoresizingMaskIntoConstraints = false
//        address.topAnchor.constraint(equalTo: addressLabel.bottomAnchor).isActive = true
//        address.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
//        address.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
//        address.heightAnchor.constraint(equalToConstant: 30).isActive = true
//    }
//
//    func setupCityStateLabelConstraints() {
//        cityStateLabel.translatesAutoresizingMaskIntoConstraints = false
//        cityStateLabel.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 4).isActive = true
//        cityStateLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
//        cityStateLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
//    }
//
//    func setupCityStateConstraints() {
//        cityState.translatesAutoresizingMaskIntoConstraints = false
//        cityState.topAnchor.constraint(equalTo: cityStateLabel.bottomAnchor).isActive = true
//        cityState.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
//        cityState.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
//        cityState.heightAnchor.constraint(equalToConstant: 30).isActive = true
//    }
}
