//
//  EmptyDataView.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/17/21.
//

import UIKit

class EmptyView: UIView {
    
    private(set) var imageView: UIImageView!
    private(set) var messageLabel: UILabel!

    var message: String?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.initializeComponents()
        self.buildViewHierarchy()
        self.setupComponents()
    }
    
    private func initializeComponents() {
        self.imageView = UIImageView()
        self.messageLabel = UILabel()
    }
    
    private func buildViewHierarchy() {
        self.addSubview(self.imageView)
        self.addSubview(self.messageLabel)
    }
    
    private func setupComponents() {
        self.setupImageView()
        self.setupMessageLabel()
    }
    
    private func setupImageView() {
        self.imageView.image = UIImage(systemName: "questionmark.folder")
        self.imageView.tintColor = .systemGray3
        self.imageView.contentMode = .scaleAspectFill
        setupImageViewConstraints()
    }
    
    private func setupMessageLabel() {
        self.messageLabel.font = UIFont.recursiveMedium(size: 18)
        self.messageLabel.textAlignment = .center
        self.messageLabel.textColor = .gray
        self.messageLabel.numberOfLines = 0
        setupMessageLabelConstraints()
    }
    
    func updateLabel() {
        self.messageLabel.text = message ?? ""
    }
}

extension EmptyView {
    
    func setupImageViewConstraints() {
        let imageSize: CGFloat = 80
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 50).isActive = true
        imageView.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: imageSize).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: imageSize).isActive = true
    }
    
    func setupMessageLabelConstraints() {
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20).isActive = true
        messageLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        messageLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -100).isActive = true
        messageLabel.heightAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
}

