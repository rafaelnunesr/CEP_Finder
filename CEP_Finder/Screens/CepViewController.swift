//
//  CepViewController.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/10/21.
//

import UIKit
import MapKit
import SwiftMaskTextfield
import SideMenu

class CepViewController: UIViewController {
    
    let regionRadius: CLLocationDistance = 1000
    
    // MARK: Components
    var sideMenu: SideMenuNavigationController?
    let map: MKMapView = MKMapView()
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
    
    // MARK: Setup()
    private func setup() {
        self.buildViewHierarchy()
        self.setupSideMenu()
        self.setupComponents()
    }
    
    // MARK: SetupSubviews
    private func buildViewHierarchy() {
        self.view.addSubview(self.map)
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
        self.setupMap()
        self.setupBackHeaderView()
        self.setupTopHeaderView()
        self.setupMenu()
        self.setupSearchField()
        self.setupSearchButton()
        self.setupFooterView()
        self.setupLastFooterView()
    }
    
    // MARK: SetupMap
    private func setupMap() {
        
        self.setupMapConstraints()
        
        let initialLocation = CLLocation(latitude: -23.565163997932217, longitude: -46.652365089520536)
        let coordinaRegion = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: self.regionRadius, longitudinalMeters: self.regionRadius)
        self.map.setRegion(coordinaRegion, animated: true)
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
        
        self.searchField.rightPadding
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
        
        guard let cep = searchField.text else { return }
        
        let s = cep.filter { $0 != "-" }
        
        let add = CepWorker()
        add.cep = s
        
        add.getAddress { (result, error) in
            
            guard let _result = result else {
                DispatchQueue.main.async {
                    self.alertUser()
                }
                return
            }
            
            self.updateLabels(result: _result)
        }
        
    }
    // MARK: AlertUser
    private func alertUser() {
        let alert = UIAlertController(title: "Cep Invalid", message: "Sorry, the cep you request doesn't exist.", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .cancel)
        
        alert.addAction(okAction)
        self.present(alert, animated: true)
    }
    
    // MARK: UpdateLabels
    private func updateLabels(result: CEP) {
        
        let address = Address(logradouro: result.logradouro, localidade: result.localidade, uf: result.uf)
        
        NotificationCenter.default.post(name: Notification.Name("updateAddress"), object: address)
        
    }
    
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

extension CepViewController {
    
    // MARK: setupMapConstraints
    func setupMapConstraints() {
        map.translatesAutoresizingMaskIntoConstraints = false
        
        map.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        map.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        map.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        map.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    // MARK: SetupBackHeaderViewConstraints
    func setupBackHeaderViewConstraints() {
        backHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        backHeaderView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        backHeaderView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    // MARK: SetupTopHeaderViewConstraints
    func setupTopHeaderViewConstraints() {
        topHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        topHeaderView.bottomAnchor.constraint(equalTo: backHeaderView.bottomAnchor, constant: 20).isActive = true
        topHeaderView.leadingAnchor.constraint(equalTo: backHeaderView.leadingAnchor, constant: 4).isActive = true
        topHeaderView.trailingAnchor.constraint(equalTo: backHeaderView.trailingAnchor, constant: -4).isActive = true
        topHeaderView.heightAnchor.constraint(equalToConstant: 240).isActive = true
    }
    
    // MARK: SetupMenuButtonConstraints
    func setupMenuButtonConstraints() {
        menuButton.translatesAutoresizingMaskIntoConstraints = false
        menuButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        menuButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 2).isActive = true
        menuButton.heightAnchor.constraint(equalToConstant: 52).isActive = true
        menuButton.widthAnchor.constraint(equalToConstant: 52).isActive = true
    }
    
    // MARK: SetupSearchFieldConstraints
    func setupSearchFieldConstraints() {
        searchField.translatesAutoresizingMaskIntoConstraints = false
        
        searchField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        searchField.leadingAnchor.constraint(equalTo: menuButton.trailingAnchor, constant: 2).isActive = true
        searchField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24).isActive = true
        searchField.heightAnchor.constraint(equalToConstant: 52).isActive = true
    }
    
    // MARK: SetupSearchButtonConstraints
    func setupSearchButtonConstraints() {
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        
        searchButton.centerYAnchor.constraint(equalTo: searchField.centerYAnchor).isActive = true
        searchButton.topAnchor.constraint(equalTo: searchField.topAnchor, constant: 2).isActive = true
        searchButton.bottomAnchor.constraint(equalTo: searchField.bottomAnchor, constant: -2).isActive = true
        searchButton.trailingAnchor.constraint(equalTo: searchField.trailingAnchor, constant: -2).isActive = true
        searchButton.widthAnchor.constraint(equalTo: searchField.heightAnchor, constant: -2).isActive = true
    }
    
    // MARK: SetupFooterViewConstraints
    func setupFooterViewConstraints() {
        
        footerView.translatesAutoresizingMaskIntoConstraints = false
        footerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        footerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        footerView.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -130).isActive = true
        footerView.heightAnchor.constraint(equalToConstant: 250).isActive = true
    }
    
    // MARK: SetupFooterLineConstraints
    func setupFooterLineConstraints() {
        footerLine.translatesAutoresizingMaskIntoConstraints = false
        footerLine.leadingAnchor.constraint(equalTo: footerView.leadingAnchor).isActive = true
        footerLine.trailingAnchor.constraint(equalTo: footerView.trailingAnchor).isActive = true
        footerLine.heightAnchor.constraint(equalToConstant: 5).isActive = true
        footerLine.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -5).isActive = true
    }
}
