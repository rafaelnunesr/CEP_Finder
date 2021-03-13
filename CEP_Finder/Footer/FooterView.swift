//
//  FooterView.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/13/21.
//

import UIKit

class FooterView: UIView, UpdateInfo {
    
    func updateView(address: Address) {
        print("&&&&&&&")
    }

    // MARK: Components
    let myLeadingAnchor: CGFloat = 20
    let myTrailingAnchor: CGFloat = -50
    
    private let favoriteButton: UIButton = UIButton()
    private let addressView: AddressFieldView = AddressFieldView()
    private let cityStateView: AddressFieldView = AddressFieldView()
    
    var address: String?
    
    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    private func setup() {
        self.setupSubviews()
        self.setupComponents()
    }
    
    // MARK: SetupSubviews
    private func setupSubviews() {
        self.addSubview(self.favoriteButton)
        self.addSubview(self.addressView)
        self.addSubview(self.cityStateView)
    }
   
    // MARK: SetupComponents
    private func setupComponents() {
        self.setupFavoriteButton()
        self.setupAddressView()
        self.setupStateCityView()
        
    }
    
    // MARK: SetupFavoriteButton
    private func setupFavoriteButton() {
        
        self.favoriteButton.setImage(UIImage(systemName: "suit.heart"), for: .normal)
        self.favoriteButton.setImage(UIImage(systemName: "suit.heart.fill"), for: .selected)
        self.favoriteButton.tintColor = .white
        self.favoriteButton.imageView?.contentMode = .scaleAspectFill
        self.favoriteButton.addTarget(self, action: #selector(favoriteButtonTapped), for: .touchUpInside)
        
        self.setupFavoriteButtonConstraints()
    }
    
    // MARK: FavoriteButtonTapped
    @objc private func favoriteButtonTapped() {
        if self.favoriteButton.isSelected {
            self.favoriteButton.isSelected = false
        }else {
            self.favoriteButton.isSelected = true
        }
    }
    
    // MARK: SetupAddressView
    private func setupAddressView() {
        self.addressView.address = AddressField(title: AddressSearchResult.streetTitle, addressInfo: self.address ?? "")
        self.addressView.setup()
        self.setupAddressViewConstraints()
    }

    // MARK: SetupStateCityView
    private func setupStateCityView() {
        self.cityStateView.address = AddressField(title: AddressSearchResult.stateCityTitle, addressInfo: self.address ?? "")
        self.cityStateView.setup()
        self.setupCityStateConstraints()
    }

}

extension FooterView {
    
    // MARK: SetupFavoriteButtonConstraints
    func setupFavoriteButtonConstraints() {
        let buttonSize: CGFloat = 30
        
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        favoriteButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        favoriteButton.heightAnchor.constraint(equalToConstant: buttonSize).isActive = true
        favoriteButton.widthAnchor.constraint(equalToConstant: buttonSize).isActive = true
    }
    
    // MARK: SetupAddressViewConstraints
    func setupAddressViewConstraints() {
        addressView.translatesAutoresizingMaskIntoConstraints = false
        addressView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        addressView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: myLeadingAnchor).isActive = true
        addressView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: myTrailingAnchor).isActive = true
        addressView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }

    // MARK: SetupCityStateConstraints
    func setupCityStateConstraints() {
        cityStateView.translatesAutoresizingMaskIntoConstraints = false
        cityStateView.topAnchor.constraint(equalTo: addressView.bottomAnchor, constant: 4).isActive = true
        cityStateView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: myLeadingAnchor).isActive = true
        cityStateView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: myTrailingAnchor).isActive = true
        cityStateView.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
}
