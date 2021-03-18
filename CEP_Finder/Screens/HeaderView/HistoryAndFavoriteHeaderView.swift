//
//  HistoryAndFavoriteHeaderView.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/15/21.
//

import UIKit

class HistoryAndFavoriteHeaderView: UIView {
    
    // MARK: Components
    let homeButton: UIButton = UIButton()
    let titleLabel: UILabel = UILabel()
    let clearButton: UIButton = UIButton()

    var headerTitle: String?
    
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
        self.buildViewHierarchy()
        self.setupComponents()
    }
    
    // MARK: BuildViewHierarchy
    private func buildViewHierarchy() {
        self.addSubview(self.homeButton)
        self.addSubview(self.titleLabel)
        self.addSubview(self.clearButton)
    }
    
    // MARK:
    private func setupComponents() {
        self.setupView()
        self.setupHomeButton()
        self.setupTitleLabel()
        self.setupClearButton()
    }
    
    // MARK: SetupView
    private func setupView() {
        self.backgroundColor = Colors.lightOrange
    }
    
    // MARK:
    private func setupHomeButton() {
        self.homeButton.buttonWithIcon(systemImage: ButtonIcons.home)
        setupHomeButtonConstraints()
    }
    
    // MARK:
    private func setupTitleLabel() {
        self.titleLabel.font = UIFont.recursiveMedium(size: 20)
        self.titleLabel.textColor = .white
        self.titleLabel.textAlignment = .center
    }
    
    // MARK:
    private func setupClearButton() {
        self.clearButton.buttonWithIcon(systemImage: ButtonIcons.trash)
        setupClearHistoryButtonConstraints()
    }
    
    func updateTitleLabel() {
        self.titleLabel.text = self.headerTitle ?? ""
    }
    
}

extension HistoryAndFavoriteHeaderView {
    
    // MARK: SetupHomeButtonConstraints
    func setupHomeButtonConstraints() {
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        homeButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 24).isActive = true
        homeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        homeButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    // MARK: SetupTitleLabelConstraints
    func setupTitleLabelConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerYAnchor.constraint(equalTo: homeButton.centerYAnchor).isActive = true
        titleLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
    
    // MARK: SetupClearHistoryButtonConstraints
    func setupClearHistoryButtonConstraints() {
        clearButton.translatesAutoresizingMaskIntoConstraints = false
        clearButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        clearButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -24).isActive = true
        clearButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        clearButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
