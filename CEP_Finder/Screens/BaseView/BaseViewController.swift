//
//  BaseViewController.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/16/21.
//

import UIKit

class BaseViewController: UIViewController {
    
    // MARK: LoadingView
    let loadingView: LoadingView = LoadingView()

    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        self.setupBaseViewController()
    }
    
    // MARK: SetupBaseViewController
    private func setupBaseViewController() {
        self.view.addSubview(self.loadingView)
        self.setupLoadingViewConstraint()
        self.setupLoadingView()
    }
    
    // MARK: SetupLoadingView
    private func setupLoadingView() {
        self.loadingView.backgroundColor = UIColor.black.withAlphaComponent(0.4)
    }

    // MARK: ShowLoadingView
    func showLoadingView() {
        self.view.bringSubviewToFront(self.loadingView)
        self.loadingView.isHidden = false
        self.loadingView.playAnimation()
    }
    
    // MARK: HiddenLoadingView
    func hiddenLoadingView() {
        self.loadingView.stopAnimation()
        self.loadingView.isHidden = true
    }
    
    // MARK: SetupLoadingViewConstraint
    private func setupLoadingViewConstraint() {
        self.loadingView.frame = self.view.frame
    }
}
