//
//  AboutViewController.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/14/21.
//

import UIKit

class AboutViewController: UIViewController {
    
    let aboutLabel: UILabel = UILabel()
    let dismissButton: UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(red: 1.00, green: 0.53, blue: 0.00, alpha: 1.00)
        self.view.alpha = 0.8
        self.setup()
    }
    
    private func setup() {
        self.setupSubviews()
        self.setupComponents()
    }
    
    private func setupSubviews() {
        self.view.addSubview(self.aboutLabel)
        self.view.addSubview(self.dismissButton)
    }
    
    private func setupComponents() {
        self.setupAboutLabel()
        self.setupDismissButton()
    }
    
    private func setupAboutLabel() {
        aboutLabel.numberOfLines = 0
        aboutLabel.textColor = .black
        aboutLabel.font = UIFont.recursiveMedium(size: 15)
        
        aboutLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quis pharetra elit. Aenean risus nisl, consectetur et nisi sed, finibus fringilla magna. Morbi ullamcorper urna maximus erat rhoncus, laoreet feugiat ex ullamcorper. Duis gravida hendrerit cursus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Proin tortor ligula, ornare eu tincidunt elementum, ultrices eu purus. Aenean sagittis ex eu ex rhoncus, et finibus nunc eleifend. Mauris posuere lorem dolor, ut viverra neque sodales vel. Vestibulum efficitur elit eu justo ultricies feugiat. Donec felis metus, aliquet quis ullamcorper sit amet, pretium at enim. Nulla semper arcu mi, quis tincidunt ligula accumsan feugiat. Ut in leo nec purus varius facilisis nec eu dolor. Nulla iaculis nisi eu interdum tincidunt."
        
        
        aboutLabel.translatesAutoresizingMaskIntoConstraints = false
        aboutLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
        aboutLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        aboutLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        aboutLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -80).isActive = true
    }
    
    private func setupDismissButton() {
        dismissButton.setTitle("Dismiss", for: .normal)
        dismissButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        dismissButton.tintColor = .black
        
        dismissButton.layer.cornerRadius = 4
        dismissButton.backgroundColor = .white
        dismissButton.alpha = 0.3
        
        dismissButton.translatesAutoresizingMaskIntoConstraints = false
        dismissButton.topAnchor.constraint(equalTo: aboutLabel.bottomAnchor, constant: 4).isActive = true
        dismissButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        dismissButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        dismissButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
    }
    
    @objc private func dismissButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
}
