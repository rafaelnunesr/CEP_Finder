//
//  ViewController.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/10/21.
//

import UIKit
import MapKit
import SwiftMaskTextfield

class ViewController: UIViewController {
    
    let regionRadius: CLLocationDistance = 1000
    
    let map: MKMapView = MKMapView()
    let headerView: UIView = UIView()
    let headerView2: UIView = UIView()
    let menu: UIButton = UIButton()
    let searchField: SwiftMaskTextfield = SwiftMaskTextfield()
    let searchButton: UIButton = UIButton()
    let footerView: UIView = UIView()
    let addressLabel: UILabel = UILabel()
    let address: UILabel = UILabel()
    let cityStateLabel: UILabel = UILabel()
    let cityState: UILabel = UILabel()
    let infoButton: UIButton = UIButton()
    let lastFooterView: UIView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    private func setup() {
        self.setupSubviews()
        self.setupDelegates()
        self.setupComponents()
    }
    
    private func setupSubviews() {
        self.view.addSubview(self.map)
        self.view.addSubview(self.headerView)
        self.view.addSubview(self.headerView2)
        self.view.addSubview(self.menu)
        self.view.addSubview(self.searchField)
        self.view.addSubview(self.searchButton)
        self.view.addSubview(self.footerView)
        self.view.addSubview(self.addressLabel)
        self.view.addSubview(self.address)
        self.view.addSubview(self.cityStateLabel)
        self.view.addSubview(self.cityState)
        self.view.addSubview(self.infoButton)
        self.view.addSubview(self.lastFooterView)
    }
    
    private func setupDelegates() {
        self.searchField.delegate = self
    }
    
    private func setupComponents() {
        self.setupMap()
        self.setupHeaderView()
        self.setupHeaderView2()
        self.setupMenu()
        self.setupSearchField()
        self.setupSearchButton()
        self.setupFooterView()
        self.setupAddressLabel()
        self.setupAddress()
        self.setupCityLabel()
        self.setupCityState()
        self.setupInfoButton()
        self.setupLastFooterView()
    }
    
    private func setupMap() {
        
        let initialLocation = CLLocation(latitude: -23.565163997932217, longitude: -46.652365089520536)
        let coordinaRegion = MKCoordinateRegion(center: initialLocation.coordinate, latitudinalMeters: self.regionRadius, longitudinalMeters: self.regionRadius)
        self.map.setRegion(coordinaRegion, animated: true)
        
        self.map.translatesAutoresizingMaskIntoConstraints = false
        
        self.map.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.map.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.map.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.map.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    private func setupHeaderView() {
        self.headerView.backgroundColor = UIColor(red: 1.00, green: 0.53, blue: 0.00, alpha: 1.00)
        
        self.headerView.translatesAutoresizingMaskIntoConstraints = false
        
        self.headerView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.headerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.headerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.headerView.heightAnchor.constraint(equalToConstant: 120).isActive = true
    }
    
    private func setupHeaderView2() {
        self.headerView2.translatesAutoresizingMaskIntoConstraints = false
        self.headerView2.backgroundColor = .white
        self.headerView2.alpha = 0.8
        self.headerView2.layer.cornerRadius = 8
        
        
        self.headerView2.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.headerView2.layer.shadowColor = UIColor.black.cgColor
        self.headerView2.layer.shadowRadius = 4
        self.headerView2.layer.shadowOpacity = 0.4
        
        self.headerView2.bottomAnchor.constraint(equalTo: self.headerView.bottomAnchor, constant: 20).isActive = true
        self.headerView2.leadingAnchor.constraint(equalTo: self.headerView.leadingAnchor, constant: 4).isActive = true
        self.headerView2.trailingAnchor.constraint(equalTo: self.headerView.trailingAnchor, constant: -4).isActive = true
        self.headerView2.heightAnchor.constraint(equalToConstant: 240).isActive = true
    }
    
    private func setupMenu() {
        
        self.menu.tintColor = .black
        let btnImage = UIImage(systemName: "line.horizontal.3")
        self.menu.setImage(btnImage, for: .normal)
        self.menu.addTarget(self, action: #selector(menuTapped), for: .touchUpInside)
        
        self.menu.translatesAutoresizingMaskIntoConstraints = false
        self.menu.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        self.menu.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 2).isActive = true
        self.menu.heightAnchor.constraint(equalToConstant: 52).isActive = true
        self.menu.widthAnchor.constraint(equalToConstant: 52).isActive = true
    }
    
    @objc private func menuTapped() {
        
    }
    
    private func setupSearchField() {
        self.searchField.backgroundColor = UIColor(red: 1.00, green: 0.53, blue: 0.00, alpha: 1.00)
        self.searchField.layer.cornerRadius = 4
        self.searchField.alpha = 0.7
        
        //self.searchField.placeholder = "Type CEP"
        self.searchField.rightPadding
        self.searchField.keyboardType = .numberPad
        self.searchField.formatPattern = "#####-###"
        self.searchField.font = UIFont.recursiveMedium(size: 18)
        self.searchField.attributedPlaceholder = NSAttributedString(string: "Type CEP", attributes: [
            .foregroundColor: UIColor.white,
            .font: UIFont.recursiveMedium(size: 18)
        ])
        
        
        self.searchField.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.searchField.layer.shadowColor = UIColor.black.cgColor
        self.searchField.layer.shadowRadius = 4
        self.searchField.layer.shadowOpacity = 0.3
        
        self.searchField.translatesAutoresizingMaskIntoConstraints = false
        
        self.searchField.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        self.searchField.leadingAnchor.constraint(equalTo: self.menu.trailingAnchor, constant: 2).isActive = true
        self.searchField.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -24).isActive = true
        self.searchField.heightAnchor.constraint(equalToConstant: 52).isActive = true
    }
    
    private func setupSearchButton() {
        let btnImage = UIImage(systemName: "magnifyingglass")
        self.searchButton.setImage(btnImage, for: .normal)
        self.searchButton.tintColor = .white
        self.searchButton.backgroundColor = UIColor(red: 1.00, green: 0.53, blue: 0.00, alpha: 1.00)
        
        self.searchButton.layer.cornerRadius = 4
        
        self.searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        
        self.searchButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.searchButton.centerYAnchor.constraint(equalTo: self.searchField.centerYAnchor).isActive = true
        self.searchButton.topAnchor.constraint(equalTo: self.searchField.topAnchor, constant: 2).isActive = true
        self.searchButton.bottomAnchor.constraint(equalTo: self.searchField.bottomAnchor, constant: -2).isActive = true
        self.searchButton.trailingAnchor.constraint(equalTo: self.searchField.trailingAnchor, constant: -2).isActive = true
        self.searchButton.widthAnchor.constraint(equalTo: self.searchField.heightAnchor, constant: -2).isActive = true
    }
    
    @objc private func searchButtonTapped() {
        self.searchField.resignFirstResponder()
        
        guard let cep = searchField.text else { return }
        
        let s = cep.filter { $0 != "-" }
        
        let session = URLSession.shared
        let url = URL(string: "https://viacep.com.br/ws/\(s)/json/")
        
        guard let _url = url else { return }
        
        let task = session.dataTask(with: _url) { (data, response, error) in
            
            guard let _data = data else { return }
            
            do{
                let result = try JSONDecoder().decode(CEP.self, from: _data)
                
                self.updateLabels(result: result)

            }catch {
                
            }
            
        }
        task.resume()
        
        
    }
    
    private func updateLabels(result: CEP) {
        DispatchQueue.main.async {
            self.address.text = result.logradouro
            self.cityState.text = result.localidade + " / " + result.uf
        }
        
    }
    
    
    private func setupFooterView() {
        
        self.footerView.translatesAutoresizingMaskIntoConstraints = false
        self.footerView.backgroundColor = UIColor(red: 1.00, green: 0.53, blue: 0.00, alpha: 1.00)
        self.footerView.alpha = 0.8
        
        self.footerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.footerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.footerView.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -130).isActive = true
        self.footerView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        
    }
    
    private func setupAddressLabel() {
        self.addressLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addressLabel.text = "Street / Avenue"
        self.addressLabel.textColor = .black
        self.addressLabel.font = UIFont.recursiveRegular(size: 15)
        
        self.addressLabel.topAnchor.constraint(equalTo: self.footerView.topAnchor, constant: 10).isActive = true
        self.addressLabel.leadingAnchor.constraint(equalTo: self.footerView.leadingAnchor, constant: 20).isActive = true
        self.addressLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    private func setupAddress() {
        self.address.translatesAutoresizingMaskIntoConstraints = false
        self.address.text = "No valid CEP provied"
        self.address.textColor = .white
        self.address.font = UIFont.recursiveMedium(size: 20)
        
        self.address.topAnchor.constraint(equalTo: self.addressLabel.bottomAnchor).isActive = true
        self.address.leadingAnchor.constraint(equalTo: self.footerView.leadingAnchor, constant: 20).isActive = true
        self.address.trailingAnchor.constraint(equalTo: self.footerView.trailingAnchor, constant: -20).isActive = true
        self.address.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    private func setupCityLabel() {
        self.cityStateLabel.translatesAutoresizingMaskIntoConstraints = false
        self.cityStateLabel.text = "City / State"
        self.cityStateLabel.textColor = .black
        self.cityStateLabel.font = UIFont.recursiveRegular(size: 15)
        
        self.cityStateLabel.topAnchor.constraint(equalTo: self.address.bottomAnchor, constant: 4).isActive = true
        self.cityStateLabel.leadingAnchor.constraint(equalTo: self.footerView.leadingAnchor, constant: 20).isActive = true
        self.cityStateLabel.heightAnchor.constraint(equalToConstant: 15).isActive = true
    }
    
    private func setupCityState() {
        self.cityState.translatesAutoresizingMaskIntoConstraints = false
        self.cityState.text = "No valid CEP provied"
        self.cityState.textColor = .white
        self.cityState.font = UIFont.recursiveMedium(size: 20)
        
        self.cityState.topAnchor.constraint(equalTo: self.cityStateLabel.bottomAnchor).isActive = true
        self.cityState.leadingAnchor.constraint(equalTo: self.footerView.leadingAnchor, constant: 20).isActive = true
        self.cityState.trailingAnchor.constraint(equalTo: self.footerView.trailingAnchor, constant: -20).isActive = true
        self.cityState.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
    }
    
    private func setupInfoButton() {
        let btnImage = UIImage(systemName: "info.circle")
        self.infoButton.setImage(btnImage, for: .normal)
        self.infoButton.contentMode = .scaleAspectFit
        self.infoButton.tintColor = .black
        
        self.infoButton.addTarget(self, action: #selector(infoButtonTapped), for: .touchUpInside)
        
        
        self.infoButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.infoButton.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -60).isActive = true
        self.infoButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -10).isActive = true
        self.infoButton.heightAnchor.constraint(equalToConstant: 40).isActive = true
        self.infoButton.widthAnchor.constraint(equalToConstant: 40).isActive = true
    }
    
    @objc private func infoButtonTapped() {
        
    }
    
    private func setupLastFooterView() {
        self.lastFooterView.translatesAutoresizingMaskIntoConstraints = false
        self.lastFooterView.backgroundColor = UIColor(red: 1.00, green: 0.30, blue: 0.00, alpha: 1.00)
        
        self.lastFooterView.leadingAnchor.constraint(equalTo: self.footerView.leadingAnchor).isActive = true
        self.lastFooterView.trailingAnchor.constraint(equalTo: self.footerView.trailingAnchor).isActive = true
        self.lastFooterView.heightAnchor.constraint(equalToConstant: 10).isActive = true
        self.lastFooterView.topAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10).isActive = true
    }

}

extension ViewController: UITextFieldDelegate {
    override class func didChangeValue(forKey key: String) {
        
    }
}

