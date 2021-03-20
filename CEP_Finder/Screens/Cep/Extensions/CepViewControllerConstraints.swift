//
//  CepViewControllerConstraints.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/17/21.
//

import Foundation

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
