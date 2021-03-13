//
//  AddressFieldView.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/13/21.
//

import UIKit

enum AddressSearchResult: String {
    case streetTitle = "Street / Avenue"
    case stateCityTitle = "City / State"
}

struct AddressField {
    var title: AddressSearchResult
    var addressInfo: String
    
    init(title: AddressSearchResult, addressInfo: String) {
        self.title = title
        self.addressInfo = addressInfo
    }
}

class AddressFieldView: UIView {
    
    private let titleLabel: UILabel = UILabel()
    private let label: UILabel = UILabel()
    
    var address: AddressField?

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
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
        
        guard let _address = address else { return }
        
        self.titleLabel.text = _address.title.rawValue
        self.titleLabel.textColor = .black
        self.titleLabel.font = UIFont.recursiveRegular(size: 15)
        
        setupTitleLabelConstraints()
    }
    
    private func setupLabel() {
        guard let _address = address else { return }
        
        self.label.text = _address.addressInfo
        self.label.textColor = .white
        self.label.font = UIFont.recursiveMedium(size: 20)
        
        setupLabelConstraints()
    }
}

extension AddressFieldView {
    
    private func setupTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    private func setupLabelConstraints() {
        label.translatesAutoresizingMaskIntoConstraints = false
        label.topAnchor.constraint(equalTo: titleLabel.bottomAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
}
