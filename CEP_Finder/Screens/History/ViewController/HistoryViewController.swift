//
//  HistoryViewController.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/14/21.
//

import UIKit

class HistoryViewController: AddressViewController {

    // MARK: Components
    var controller: HistoryController = HistoryController()
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    // MARK: Setup
    private func setup() {
        self.loadHistoryController()
        self.checkHistoryItems()
        self.setupComponents()
    }
    
    // MARK: LoadHistoryController
    private func loadHistoryController() {
        self.controller.getAllAddresses(completionHandler: { (result) in
            if result {
                self.tableView.reloadData()
            }else {
                self.emptyView.isHidden = false
            }
        })
    }
    
    // MARK: SetupComponents
    private func setupComponents() {
        self.setupTitleLabel()
        self.setupTableView()
    }
    
    // MARK: SetupTitleLabel
    private func setupTitleLabel() {
        self.header.headerTitle = "History"
        self.header.updateTitleLabel()
    }
    
    // MARK: ClearButtonTapped
    override func clearButtonTapped() {
        let alert = UIAlertController(title: "Delete All History", message: "Are you sure you want to delete all history data?", preferredStyle: .alert)
        let deleteButton = UIAlertAction(title: "Delete", style: .destructive) { (UIAlertAction) in
            self.controller.deleteAllAddresses()
            self.showEmptyView()
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { (UIAlertAction) in
            print("cancel")
        }
        
        alert.addAction(cancelButton)
        alert.addAction(deleteButton)
        

        present(alert, animated: true)
    }
    
    private func showEmptyView() {
        self.emptyView.isHidden = false
    }
    
    private func checkHistoryItems() {
        if self.controller.quantity > 0 {
            self.emptyView.isHidden = true
        }else {
            self.showEmptyView()
        }
    }
    
    // MARK: SetupTableView
    override func setupTableView() {
        super.setupTableView()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}
