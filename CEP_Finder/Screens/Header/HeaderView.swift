//
//  HeaderView.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/15/21.
//

import UIKit

class HeaderView: UIView {
    
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
        self.setupClearHistoryButton()
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
    private func setupClearHistoryButton() {
        self.clearButton.buttonWithIcon(systemImage: ButtonIcons.trash)
        setupClearHistoryButtonConstraints()
    }

    func updateTitleLabel() {
        print(self.headerTitle)
        self.titleLabel.text = self.headerTitle ?? ""
    }
    
}
