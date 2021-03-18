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
    var emptyView: EmptyDataView = EmptyDataView()
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    private func setup() {
        self.setupBackgroundColor()
        self.setupSubviews()
        self.setupComponents()
    }
    
    // MARK: SetupBackgroundColor
    private func setupBackgroundColor() {
        self.view.backgroundColor = Colors.ligherOrange
    }
    
    // MARK: SetupSubviews
    private func setupSubviews() {
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
    private func setupEmptyView() {
        self.emptyView.backgroundColor = Colors.ligherOrange
        self.emptyView.isHidden = true
        setupEmptyViewConstraints()
    }
    
}
