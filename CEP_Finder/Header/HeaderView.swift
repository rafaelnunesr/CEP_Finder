//
//  HeaderView.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/15/21.
//

import UIKit

class HeaderView: UIView {
    
    let homeButton: UIButton = UIButton()
    let clearHistoryButton: UIButton = UIButton()
    let titleLabel: UILabel = UILabel()

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
        self.addSubview(self.homeButton)
        self.addSubview(self.titleLabel)
        self.addSubview(self.clearHistoryButton)
    }
    
    private func setupComponents() {
        self.setupHeader()
        self.setupHomeButton()
        self.setupTitle()
        self.setupClearHistory()
    }
    
    private func setupHeader() {
        self.backgroundColor = UIColor(red: 0.99, green: 0.64, blue: 0.27, alpha: 1.00)
    }
    
    private func setupHomeButton() {
        let btnImage = UIImage(systemName: "house.fill")
        self.homeButton.setImage(btnImage, for: .normal)
        self.homeButton.contentMode = .scaleAspectFill
        self.homeButton.tintColor = .white
        self.homeButton.layer.cornerRadius = 4
        
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        homeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        homeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        homeButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func setupTitle() {
        
        self.titleLabel.font = UIFont.recursiveMedium(size: 20)
        self.titleLabel.textColor = .white
        self.titleLabel.textAlignment = .center
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: homeButton.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    private func setupClearHistory() {
        let btnImage = UIImage(systemName: "trash.fill")
        self.clearHistoryButton.setImage(btnImage, for: .normal)
        self.clearHistoryButton.contentMode = .scaleAspectFill
        self.clearHistoryButton.tintColor = .white
        self.clearHistoryButton.layer.cornerRadius = 4
        
        clearHistoryButton.translatesAutoresizingMaskIntoConstraints = false
        clearHistoryButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        clearHistoryButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
        clearHistoryButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        clearHistoryButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }

}
