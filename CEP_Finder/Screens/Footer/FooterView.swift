//
//  FooterView.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/13/21.
//

import UIKit

class FooterView: UIView {

    // MARK: Components
    let favoriteButton: UIButton = UIButton()
    let addressView: AddressFieldView = AddressFieldView()
    let cityStateView: AddressFieldView = AddressFieldView()
    
    var address: String?
    var city: String?
    
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
        self.setupNotificationCenter()
        self.buildViewHierarchy()
        self.setupComponents()
    }
    
    // MARK: SetupNotificationCenter
    private func setupNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateLabels), name: NSNotification.Name("updateAddress"), object: nil)
    }
    
    // MARK: UpdateLabels
    @objc private func updateLabels(_ notification: Notification) {
        
        let newAddress = notification.object as? Address
        
        DispatchQueue.main.async {
            self.address = newAddress?.logradouro
            self.city = newAddress?.cityState
            
            self.setupAddressView()
            self.setupStateCityView()
        }
    }
    
    // MARK: BuildViewHierarchy
    private func buildViewHierarchy() {
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
        self.setupFavoriteButtonConstraints()
        self.favoriteButton.heartButton()
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
    
    // MARK: SetupAddressView
    private func setupAddressView() {
        self.setupAddressViewConstraints()
        self.addressView.address = AddressField(title: AddressSearchResult.streetTitle, addressInfo: self.address ?? "")
        self.addressView.setup()
    }

    // MARK: SetupStateCityView
    private func setupStateCityView() {
        self.setupCityStateConstraints()
        self.cityStateView.address = AddressField(title: AddressSearchResult.stateCityTitle, addressInfo: self.city ?? "")
        self.cityStateView.setup()
    }
}
