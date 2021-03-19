//
//  CepViewController.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/10/21.
//

import UIKit
import SwiftMaskTextfield
import SideMenu

class CepViewController: UIViewController {
    
    // MARK: Controller
    var controller = CepController()
    
    // MARK: Components
    var sideMenu: SideMenuNavigationController?
    let mapView: MapView = MapView()
    let backHeaderView: UIView = UIView()
    let topHeaderView: UIView = UIView()
    let menuButton: UIButton = UIButton()
    let searchField: SwiftMaskTextfield = SwiftMaskTextfield()
    let searchButton: UIButton = UIButton()
    let footerView: FooterView = FooterView()
    let footerLine: UIView = UIView()
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    // MARK: StatusBarStyle
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .darkContent
    }
    
    // MARK: Setup()
    private func setup() {
        self.setupObserver()
        self.buildViewHierarchy()
        self.setupSideMenu()
        self.setupComponents()
    }
    
    private func setupObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateFavoriteStatus), name: NSNotification.Name("updateFavorite"), object: nil)
    }
    
    @objc private func updateFavoriteStatus(_ notification: Notification) {
        
        let result = notification.object as? Bool
        
        DispatchQueue.main.async {
            if result == true {
                self.controller.addFavoriteAddress()
            }else {
                self.controller.removeFavoriteAddress()
            }
        }
    }
    
    // MARK: SetupSubviews
    private func buildViewHierarchy() {
        self.view.addSubview(self.mapView)
        self.view.addSubview(self.backHeaderView)
        self.view.addSubview(self.topHeaderView)
        self.view.addSubview(self.menuButton)
        self.view.addSubview(self.searchField)
        self.view.addSubview(self.searchButton)
        self.view.addSubview(self.footerView)
        self.view.addSubview(self.footerLine)
    }
    
    // MARK: SetupSideMenu
    private func setupSideMenu() {
        self.sideMenu = SideMenuNavigationController(rootViewController: MenuViewController())
        self.sideMenu?.leftSide = true
    }
    
    // MARK: SetupComponents
    private func setupComponents() {
        self.setupMapView()
        self.setupBackHeaderView()
        self.setupTopHeaderView()
        self.setupMenu()
        self.setupSearchField()
        self.setupSearchButton()
        self.setupFooterView()
        self.setupLastFooterView()
    }
    
    // MARK: SetupMap
    private func setupMapView() {
        self.setupMapViewConstraints()
    }
    
    // MARK: SetupBackHeaderView
    private func setupBackHeaderView() {
        self.setupBackHeaderViewConstraints()
        self.backHeaderView.backgroundColor = Colors.mainOrange
    }
    
    // MARK: SetupTopHeaderView
    private func setupTopHeaderView() {
        self.topHeaderView.backgroundColor = .white
        self.topHeaderView.alpha = 0.8
        self.topHeaderView.layer.cornerRadius = 8
        
        self.topHeaderView.applyShadow()
        
        self.setupTopHeaderViewConstraints()
    }
    
    // MARK: SetupMenu
    private func setupMenu() {
        
        self.menuButton.buttonWithIcon(systemImage: ButtonIcons.menu)
        
        self.menuButton.tintColor = .black
        self.menuButton.addTarget(self, action: #selector(menuTapped), for: .touchUpInside)
        
        self.setupMenuButtonConstraints()
    }
    
    // MARK: MenuTapped
    @objc private func menuTapped() {
        present(sideMenu!, animated: true)
    }
    
    // MARK: SetupSearchField
    private func setupSearchField() {
        self.searchField.backgroundColor = Colors.mainOrange
        self.searchField.layer.cornerRadius = 4
        self.searchField.alpha = 0.7
        
        self.searchField.applyRightPadding()
        self.searchField.keyboardType = .numberPad
        self.searchField.formatPattern = "#####-###"
        self.searchField.font = UIFont.recursiveMedium(size: 18)
        self.searchField.attributedPlaceholder = NSAttributedString(string: "Type CEP", attributes: [
            .foregroundColor: UIColor.white,
            .font: UIFont.recursiveMedium(size: 18)
        ])
        
        self.searchField.applyShadow()
        self.setupSearchFieldConstraints()
    }
    
    // MARK: SetupSearchButton
    private func setupSearchButton() {
        self.searchButton.buttonWithIcon(systemImage: ButtonIcons.search)
        self.searchButton.backgroundColor = Colors.mainOrange
        self.searchButton.layer.cornerRadius = 4
        self.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        self.setupSearchButtonConstraints()
    }
    
    // MARK: SearchButtonTapped
    @objc private func searchButtonTapped() {
        self.searchField.resignFirstResponder()
        guard let zipCode = searchField.text else { return }
        
        self.controller.getAddressByZipCode(with: zipCode) { (result) in
            
            if result == true {
                self.updateLabels()
            }
        }
    }
    
//    @objc private func searchButtonTapped() {
//        self.searchField.resignFirstResponder()
//        guard let zipCode = searchField.text else { return }
//
//        let numericZipCode = zipCode.filter { $0 != "-" }
//
//        let add = CepNetwork()
//        add.zipCode = numericZipCode
//
//        add.getAddress { (result, error) in
//
//            guard let _result = result else {
//                DispatchQueue.main.async {
//                    self.alertUser()
//                }
//                return
//            }
//
//            DispatchQueue.main.async {
//                let cityState = _result.localidade + " / " + _result.uf
//                self.controller.address = AddressCoreData(zipCode: _result.cep, streeName: _result.logradouro, cityState: cityState)
//                self.controller.addNewAddressToHistory()
//
//
//                if self.controller.checkIfAddressIsFavorited() {
//                    self.footerView.favoriteButton.isSelected = true
//                }
//
//
//                self.updateLabels(result: _result)
//            }
//
//        }
//
//    }
    
    
    
    // MARK: AlertUser
    private func alertUser() {
        let alert = UIAlertController(title: "Cep Invalid", message: "Sorry, the cep you request doesn't exist.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
    // MARK: UpdateLabels
    private func updateLabels() {
        guard let address = self.controller.address else { return }
        NotificationCenter.default.post(name: Notification.Name("updateAddress"), object: address)
    }
    
//    // MARK: UpdateLabels
//    private func updateLabels(result: CepModel) {
//
//        let address = Address(logradouro: result.logradouro, localidade: result.localidade, uf: result.uf)
//
//        NotificationCenter.default.post(name: Notification.Name("updateAddress"), object: address)
//
//    }
    
    // MARK: SetupFooterView
    private func setupFooterView() {
        self.footerView.backgroundColor = Colors.mainOrange
        self.footerView.alpha = 0.8
        self.setupFooterViewConstraints()
        
    }
    // MARK: SetupLastFooterView
    private func setupLastFooterView() {
        self.footerLine.backgroundColor = UIColor(red: 1.00, green: 0.30, blue: 0.00, alpha: 1.00)
        setupFooterLineConstraints()
    }
}
