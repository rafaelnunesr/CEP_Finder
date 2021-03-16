//
//  LoadingView.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/16/21.
//

import UIKit
import Lottie

class LoadingView: UIView {
    
    private let animatedView: AnimationView = AnimationView(name: "loading")
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        self.addSubview(self.animatedView)
        self.animatedView.contentMode = .scaleAspectFit
        self.setupAnimatedViewConstraints()
    }
    
    func playAnimation() {
        self.animatedView.loopMode = .loop
        self.animatedView.play()
    }
    
    func stopAnimation() {
        self.animatedView.stop()
    }
    
    private func setupAnimatedViewConstraints() {
        self.animatedView.translatesAutoresizingMaskIntoConstraints = false
        self.animatedView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        self.animatedView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.animatedView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        self.animatedView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
}
