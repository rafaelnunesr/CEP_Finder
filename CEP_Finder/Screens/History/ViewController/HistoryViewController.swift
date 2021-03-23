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
        self.controller.getAllHistoryAddresses(completionHandler: { (result) in
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
        self.header.titleLabel.text = "History"
    }
    
    // MARK: ClearButtonTapped
    override func clearButtonTapped() {
        let alert = UIAlertController(title: "Delete All History", message: "Are you sure you want to delete all history data?", preferredStyle: .alert)
        let deleteButton = UIAlertAction(title: "Delete", style: .destructive) { (UIAlertAction) in
            self.controller.deleteAllHistoryAddresses()
            self.showEmptyView()
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { (UIAlertAction) in
            print("cancel")
        }
        
        alert.addAction(cancelButton)
        alert.addAction(deleteButton)
        present(alert, animated: true)
    }
    
    // MARK: ShowEmptyView
    private func showEmptyView() {
        self.emptyView.isHidden = false
    }
    
    // MARK: CheckHistoryItems
    func checkHistoryItems() {
        if self.controller.historyQuantity > 0 {
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
