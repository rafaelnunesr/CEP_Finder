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
        self.setupSubviews()
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
    
    // MARK: SetupSubviews
    private func setupSubviews() {
        self.view.addSubview(self.header)
        self.view.addSubview(self.tableView)
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
            self.emptyView.isHidden = false
        }
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { (UIAlertAction) in
            print("cancel")
        }
        
        alert.addAction(cancelButton)
        alert.addAction(deleteButton)
        

        present(alert, animated: true)
    }
    
    // MARK: SetupTableView
    override func setupTableView() {
        super.setupTableView()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}



//class HistoryViewController: UIViewController {
//
//    // MARK: Components
//    let header: HeaderView = HeaderView()
//    let tableView: UITableView = UITableView()
//    var controller: HistoryController = HistoryController()
//    var emptyView: EmptyDataView = EmptyDataView()
//
//    // MARK: ViewDidLoad
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.setup()
//    }
//
//    // MARK: Setup
//    private func setup() {
//        self.setupBackgroundColor()
//        self.loadHistoryController()
//        self.setupSubviews()
//        self.setupComponents()
//    }
//
//    // MARK: SetupBackgroundColor
//    private func setupBackgroundColor() {
//        self.view.backgroundColor = Colors.ligherOrange
//    }
//
//    // MARK: LoadHistoryController
//    private func loadHistoryController() {
//        self.controller.getAllAddresses(completionHandler: { (result) in
//            if result {
//                self.tableView.reloadData()
//            }else {
//                self.emptyView.isHidden = false
//            }
//        })
//    }
//
//    // MARK: SetupSubviews
//    private func setupSubviews() {
//        self.view.addSubview(self.header)
//        self.view.addSubview(self.tableView)
//        self.view.addSubview(self.emptyView)
//    }
//
//    // MARK: SetupComponents
//    private func setupComponents() {
//        self.setupHeader()
//        self.setupHomeButton()
//        self.setupTitleLabel()
//        self.setupClearHistory()
//        self.setupTableView()
//        self.setupEmptyView()
//    }
//
//    // MARK: SetupHeader
//    private func setupHeader() {
//        setupHeaderConstraints()
//    }
//
//    // MARK: SetupHomeButton
//    private func setupHomeButton() {
//        self.header.homeButton.addTarget(self, action: #selector(homeButtonTapped), for: .touchUpInside)
//    }
//
//    // MARK: HomeButtonTapped
//    @objc private func homeButtonTapped() {
//            dismiss(animated: true, completion: nil)
//    }
//
//    // MARK: SetupTitleLabel
//    private func setupTitleLabel() {
//        self.header.headerTitle = "History"
//        self.header.updateTitleLabel()
//    }
//
//    // MARK: SetupClearHistory
//    private func setupClearHistory() {
//        self.header.clearHistoryButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
//    }
//
//    // MARK: ClearButtonTapped
//    @objc private func clearButtonTapped() {
//        let alert = UIAlertController(title: "Delete All History", message: "Are you sure you want to delete all history data?", preferredStyle: .alert)
//        let deleteButton = UIAlertAction(title: "Delete", style: .destructive) { (UIAlertAction) in
//            self.controller.deleteAllAddresses()
//            self.emptyView.isHidden = false
//        }
//        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel) { (UIAlertAction) in
//            print("cancel")
//        }
//
//        alert.addAction(cancelButton)
//        alert.addAction(deleteButton)
//
//
//        present(alert, animated: true)
//    }
//
//    // MARK: SetupTableView
//    private func setupTableView() {
//        self.tableView.backgroundColor = Colors.ligherOrange
//        self.tableView.delegate = self
//        self.tableView.dataSource = self
//
//        self.tableView.register(HistoryTableViewCell.nib(), forCellReuseIdentifier: HistoryTableViewCell.identifier)
//
//        setupTableViewConstraints()
//
//    }
//
//    // MARK: SetupEmptyView
//    private func setupEmptyView() {
//
//        if self.controller.quantity > 0 {
//            self.emptyView.isHidden = true
//        }
//
//        self.emptyView.backgroundColor = Colors.ligherOrange
//        self.emptyView.message = "You don't have a history to show."
//        self.emptyView.updateLabel()
//
//        emptyView.translatesAutoresizingMaskIntoConstraints = false
//        emptyView.topAnchor.constraint(equalTo: header.bottomAnchor).isActive = true
//        emptyView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
//        emptyView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
//        emptyView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//
//    }
//}
