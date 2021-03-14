//
//  HistoryViewController.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/14/21.
//

import UIKit

class HistoryViewController: UIViewController {

    let header: UIView = UIView()
    let homeButton: UIButton = UIButton()
    let clearHistoryButton: UIButton = UIButton()
    let tableView: UITableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 1.00, green: 0.93, blue: 0.86, alpha: 1.00)
        self.setup()
    }
    
    private func setup() {
        self.setupSubviews()
        self.setupComponents()
    }
    
    private func setupSubviews() {
        self.view.addSubview(self.header)
        self.view.addSubview(self.homeButton)
        self.view.addSubview(self.clearHistoryButton)
        self.view.addSubview(self.tableView)
    }
    
    private func setupComponents() {
        self.setupHeader()
        self.setupHomeButton()
        self.setupClearHistory()
        self.setupTableView()
    }
    
    private func setupHeader() {
        self.header.backgroundColor = UIColor(red: 0.99, green: 0.64, blue: 0.27, alpha: 1.00)
        
        header.translatesAutoresizingMaskIntoConstraints = false
        header.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        header.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        header.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        header.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    private func setupHomeButton() {
        let btnImage = UIImage(systemName: "house.fill")
        self.homeButton.setImage(btnImage, for: .normal)
        self.homeButton.contentMode = .scaleAspectFill
        self.homeButton.tintColor = .white
        self.homeButton.addTarget(self, action: #selector(homeButtonTapped), for: .touchUpInside)
        self.homeButton.layer.cornerRadius = 4
        
        homeButton.translatesAutoresizingMaskIntoConstraints = false
        homeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        homeButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 24).isActive = true
        homeButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        homeButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @objc private func homeButtonTapped() {
        let vc = CepViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true)
    }
    
    private func setupClearHistory() {
        let btnImage = UIImage(systemName: "trash.fill")
        self.clearHistoryButton.setImage(btnImage, for: .normal)
        self.clearHistoryButton.contentMode = .scaleAspectFill
        self.clearHistoryButton.tintColor = .white
        self.clearHistoryButton.addTarget(self, action: #selector(clearButtonTapped), for: .touchUpInside)
        self.clearHistoryButton.layer.cornerRadius = 4
        
        clearHistoryButton.translatesAutoresizingMaskIntoConstraints = false
        clearHistoryButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        clearHistoryButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -24).isActive = true
        clearHistoryButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        clearHistoryButton.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    @objc private func clearButtonTapped() {
        let alert = UIAlertController(title: "Delete All History", message: "Are you sure you want to delete all history data?", preferredStyle: .alert)
        let deleteButton = UIAlertAction(title: "DELETE", style: .destructive) { (UIAlertAction) in
            print("deleted")
        }
        let cancelButton = UIAlertAction(title: "CANCEL", style: .cancel) { (UIAlertAction) in
            print("cancel")
        }
        
        alert.addAction(cancelButton)
        alert.addAction(deleteButton)
        

        present(alert, animated: true)
    }
    
    private func setupTableView() {
        self.tableView.backgroundColor = UIColor(red: 1.00, green: 0.93, blue: 0.86, alpha: 1.00)
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

}
