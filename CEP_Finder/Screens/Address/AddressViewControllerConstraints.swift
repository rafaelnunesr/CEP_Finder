//
//  AddressViewControllerConstraints.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/17/21.
//

import Foundation

extension AddressViewController {
    
    // MARK: SetupHeaderConstraints
    func setupHeaderConstraints() {
        header.translatesAutoresizingMaskIntoConstraints = false
        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        header.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        header.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
     // MARK: SetupTableViewConstraints
    func setupTableViewConstraints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 8).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
    }
    
    // MARK: SetupEmptyViewConstraints
    func setupEmptyViewConstraints() {
        emptyView.translatesAutoresizingMaskIntoConstraints = false
        emptyView.topAnchor.constraint(equalTo: header.bottomAnchor).isActive = true
        emptyView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        emptyView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        emptyView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
