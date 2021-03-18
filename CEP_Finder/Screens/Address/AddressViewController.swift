//
//  AddressViewController.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/17/21.
//
import UIKit

class AddressViewController: UIViewController {
    
    // MARK: Components
    let header: HeaderView = HeaderView()
    let tableView: UITableView = UITableView()
    var emptyView: EmptyView = EmptyView()
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    // MARK: Setup
    private func setup() {
        self.setupBackgroundColor()
        self.buildViewHierarchy()
        self.setupComponents()
    }
    
    // MARK: SetupBackgroundColor
    private func setupBackgroundColor() {
        self.view.backgroundColor = Colors.ligherOrange
    }
    
    // MARK: SetupSubviews
    private func buildViewHierarchy() {
        self.view.addSubview(self.header)
        self.view.addSubview(self.tableView)
        self.view.addSubview(self.emptyView)
    }
    
    // MARK: SetupComponents
    private func setupComponents() {
        self.setupHeader()
        self.setupHomeButton()
        self.setupClearButton()
        self.setupTableView()
        self.setupEmptyView()
    }
    
    // MARK: SetupHeader
    private func setupHeader() {
        setupHeaderConstraints()
    }
    
    // MARK: SetupHomeButton
    private func setupHomeButton() {
        self.header.homeButton.addTarget(self, action: #selector(homeButtonTapped), for: .touchUpInside)
    }
    
    // MARK: HomeButtonTapped
    @objc private func homeButtonTapped() {
            dismiss(animated: true, completion: nil)
    }
    
    // MARK: SetupClearHistory
    private func setupClearButton() {
        self.header.clearButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
    }
    
    // MARK: ClearButtonTapped
    @objc func clearButtonTapped() {}
    
    // MARK: SetupTableView
    func setupTableView() {
        self.tableView.backgroundColor = Colors.ligherOrange
        
        self.tableView.register(AddressTableViewCell.nib(), forCellReuseIdentifier: AddressTableViewCell.identifier)
        
        setupTableViewConstraints()
    }
    
    // MARK: SetupEmptyView
    func setupEmptyView() {
        self.emptyView.backgroundColor = Colors.ligherOrange
        self.emptyView.message = "It looks like you don't have anything here"
        self.emptyView.updateLabel()
        setupEmptyViewConstraints()
    }
    
}
