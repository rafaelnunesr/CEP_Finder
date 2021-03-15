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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Colors.ligherOrange
        self.setup()
    }
    
    private func setup() {
        self.setupSubviews()
        self.setupComponents()
    }
    
    private func setupSubviews() {
        self.view.addSubview(self.header)
        self.view.addSubview(self.tableView)
    }
    
    private func setupComponents() {
        self.setupHeader()
        self.setupHomeButton()
        self.setupTitleLabel()
        self.setupClearHistory()
        self.setupTableView()
    }
    
    private func setupHeader() {
        header.translatesAutoresizingMaskIntoConstraints = false
        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        header.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        header.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 80).isActive = true
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
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: header.bottomAnchor, constant: 16).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
    }
}

extension HistoryViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension HistoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as? HistoryTableViewCell
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(white: 1, alpha: 0.6)
        cell?.selectedBackgroundView = backgroundView
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

}
