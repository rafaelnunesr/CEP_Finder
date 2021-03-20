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
        
        self.aboutLabel.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quis pharetra elit. Aenean risus nisl, consectetur et nisi sed, finibus fringilla magna. Morbi ullamcorper urna maximus erat rhoncus, laoreet feugiat ex ullamcorper. Duis gravida hendrerit cursus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Proin tortor ligula, ornare eu tincidunt elementum, ultrices eu purus. Aenean sagittis ex eu ex rhoncus, et finibus nunc eleifend. Mauris posuere lorem dolor, ut viverra neque sodales vel. Vestibulum efficitur elit eu justo ultricies feugiat. Donec felis metus, aliquet quis ullamcorper sit amet, pretium at enim. Nulla semper arcu mi, quis tincidunt ligula accumsan feugiat. Ut in leo nec purus varius facilisis nec eu dolor. Nulla iaculis nisi eu interdum tincidunt."
        
        
        setupAboutLabelConstraints()
    }
    
    // MARK: SetupDismissButton
    private func setupDismissButton() {
        self.dismissButton.setTitle("Dismiss", for: .normal)
        self.dismissButton.addTarget(self, action: #selector(dismissButtonTapped), for: .touchUpInside)
        self.dismissButton.setTitleColor(.black, for: .normal)
        self.dismissButton.titleLabel?.font = UIFont.recursiveRegular(size: 20)
        
        self.dismissButton.layer.cornerRadius = 4
        self.dismissButton.backgroundColor = UIColor(white: 1, alpha: 0.6)
        
        self.dismissButton.applyShadow()
        
    }
    
    // MARK: DismissButtonTapped
    @objc private func dismissButtonTapped() {
        dismiss(animated: true, completion: nil)
    }
    
}
