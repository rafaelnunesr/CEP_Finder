//
//  BaseViewController.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/16/21.
//

import UIKit

class BaseViewController: UIViewController {
    
    let loadingView: LoadingView = LoadingView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .none
        self.setupBase()
    }
    
    private func setupBase() {
        self.view.addSubview(self.loadingView)
        self.setupLoadingViewConstraint()
        self.setupLoadingView()
    }
    
    private func setupLoadingView() {
        self.loadingView.backgroundColor = UIColor.white.withAlphaComponent(0.04)
        //self.loadingView.applyShadow()
        self.loadingView.layer.cornerRadius = 20
        self.showLoadingView()
    }

    func showLoadingView() {
        self.loadingView.playAnimation()
    }
    
    func hiddenLoadingView() {
        self.loadingView.stopAnimation()
        self.loadingView.isHidden = true
    }
    
    private func setupLoadingViewConstraint() {
        let loadingViewSize: CGFloat = 200
        
        self.loadingView.translatesAutoresizingMaskIntoConstraints = false
        self.loadingView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        self.loadingView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        self.loadingView.heightAnchor.constraint(equalToConstant: loadingViewSize).isActive = true
        self.loadingView.widthAnchor.constraint(equalToConstant: loadingViewSize).isActive = true
    }
}
