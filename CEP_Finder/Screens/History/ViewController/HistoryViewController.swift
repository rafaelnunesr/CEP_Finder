//
//  HistoryViewController.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/14/21.
//

import UIKit

class HistoryViewController: UIViewController {

    let header: HeaderView = HeaderView()
    let tableView: UITableView = UITableView()
    var controller: HistoryController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Colors.ligherOrange
        self.setup()
    }
    
    private func setup() {
        self.setupSubviews()
        self.loadHistoryController()
        self.setupComponents()
    }
    
    private func setupSubviews() {
        self.view.addSubview(self.header)
        self.view.addSubview(self.tableView)
    }
    
    private func loadHistoryController() {
        
        self.controller?.getAllAddresses(completionHandler: { (result) in
            self.tableView.reloadData()
        })
    }
    
    private func setupComponents() {
        self.setupHeader()
        self.setupHomeButton()
        self.setupTitleLabel()
        self.setupClearHistory()
        self.setupTableView()
    }
    
    private func setupHeader() {
        setupHeaderConstraints()
    }
    
    private func setupHomeButton() {
        self.header.homeButton.addTarget(self, action: #selector(homeButtonTapped), for: .touchUpInside)
    }
    
    @objc private func homeButtonTapped() {
            dismiss(animated: true, completion: nil)
    }
    
    private func setupTitleLabel() {
        self.header.titleLabel.text = "History"
    }
    
    private func setupClearHistory() {
        self.header.clearHistoryButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
    }
    
    @objc private func clearButtonTapped() {
        let alert = UIAlertController(title: "Delete All History", message: "Are you sure you want to delete all history data?", preferredStyle: .alert)
        let deleteButton = UIAlertAction(title: "Delete", style: .destructive) { (UIAlertAction) in
            print("deleted")
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { (UIAlertAction) in
            print("cancel")
        }
        
        alert.addAction(cancelButton)
        alert.addAction(deleteButton)
        

        present(alert, animated: true)
    }
    
    private func setupTableView() {
        self.tableView.backgroundColor = Colors.ligherOrange
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(HistoryTableViewCell.nib(), forCellReuseIdentifier: HistoryTableViewCell.identifier)
        
        setupTableViewConstraints()
        
    }
}
