//
//  AboutViewController.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/14/21.
//

import UIKit

class AboutViewController: UIViewController {
    
    // MARK:
    let aboutLabel: UILabel = UILabel()
    let dismissButton: UIButton = UIButton()
    
    // MARK:
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colors.mainOrange
        self.view.alpha = 0.8
        self.setup()
    }
    
    // MARK:
    private func setup() {
        self.setupSubviews()
        self.setupComponents()
    }
    
    // MARK:
    private func setupSubviews() {
        self.view.addSubview(self.aboutLabel)
        self.view.addSubview(self.dismissButton)
    }
    
    // MARK:
    private func setupComponents() {
        self.setupAboutLabel()
        self.setupDismissButton()
    }
    
    // MARK:
    private func setupAboutLabel() {
        self.aboutLabel.numberOfLines = 0
        self.aboutLabel.textColor = .black
        self.aboutLabel.font = UIFont.recursiveMedium(size: 15)
        
        self.aboutLabel.text = "Cep Finder is an app where any brazilian address can be found with zip code. The nice and clean design helps you focus on what really matter: find that address, browse the local using map and favorite your loved places so you will never miss them again. A historical search is saved, so you don't need to worry about a place you've searched and don't remember any more. "
        
        
        setupAboutLabelConstraints()
    }
    
    // MARK: SetupDismissButton
    private func setupDismissButton() {
        self.dismissButton.setTitle("Dismiss", for: .normal)
        self.dismissButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        self.dismissButton.setTitleColor(.black, for: .normal)
        self.dismissButton.titleLabel?.font = UIFont.recursiveRegular(size: 20)
        
        self.dismissButton.layer.cornerRadius = 4
        self.dismissButton.backgroundColor = Colors.ligherOrange
        
        self.dismissButton.applyShadow()
        
        self.setupDismissButtonConstraints()
        
    }
    
    // MARK: DismissButtonTapped
    @objc private func dismissButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
}
