//
//  AddressFieldView.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/13/21.
//

import UIKit

// MARK: AddressSearchResult
enum AddressSearchResult: String {
    case streetTitle = "Street / Avenue"
    case stateCityTitle = "City / State"
}

// MARK: AddressField
struct AddressField {
    var title: AddressSearchResult
    var addressInfo: String
    
    init(title: AddressSearchResult, addressInfo: String) {
        self.title = title
        self.addressInfo = addressInfo
    }
}

// MARK: AddressFieldView
class AddressFieldView: UIView {
    
    // MARK: Components
    let titleLabel: UILabel = UILabel()
    let label: UILabel = UILabel()
    
    var address: AddressField?

    // MARK: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    func setup() {
        self.buildViewHierarchy()
        self.setupComponents()
    }
    
    // MARK: SetupSubviews
    private func buildViewHierarchy() {
        self.addSubview(self.titleLabel)
        self.addSubview(self.label)
    }
    
    // MARK: SetupComponents
    private func setupComponents() {
        self.setupTitleLabel()
        self.setupLabel()
    }
    
    // MARK: SetupTitleLabel
    private func setupTitleLabel() {
        
        guard let _address = address else { return }
        
        self.titleLabel.text = _address.title.rawValue
        self.titleLabel.textColor = .black
        self.titleLabel.font = UIFont.recursiveRegular(size: 15)
    
        setupTitleLabelConstraints()
    }
    
    // MARK: SetupLabel
    private func setupLabel() {
        guard let _address = address else { return }
        
        self.label.text = _address.addressInfo
        self.label.textColor = .white
        self.label.font = UIFont.recursiveMedium(size: 20)
        
        setupLabelConstraints()
    }
}
