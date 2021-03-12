//
//  MenuViewController.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/12/21.
//

import UIKit

class MenuViewController: UIViewController {
    
    let tableView: UITableView = UITableView()
    let menuItens = ["Favorites", "History", "About"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 0.99, green: 0.64, blue: 0.27, alpha: 1.00)
        
        navigationController?.navigationBar.isHidden = true
        
        self.setup()
    }

    private func setup() {
        self.setupSubviews()
        self.setupComponents()
    }
    
    private func setupSubviews() {
        self.view.addSubview(tableView)
    }
    
    private func setupComponents() {
        self.setupTableView()
    }
    
    private func setupTableView() {
        
        self.tableView.backgroundColor = UIColor(red: 0.99, green: 0.64, blue: 0.27, alpha: 1.00)
        
        self.tableView.register(MenuTableViewCell.nib(), forCellReuseIdentifier: MenuTableViewCell.identifier)
        
        self.tableView.delegate = self
        self.tableView.showsVerticalScrollIndicator = false
        self.tableView.showsHorizontalScrollIndicator = false
        self.tableView.separatorStyle = .none
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        
        self.tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
    }

}

extension MenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItens.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier, for: indexPath) as? MenuTableViewCell
        
        cell?.cellLabel.text = menuItens[indexPath.row]
        
        return cell ?? UITableViewCell()
        
    }
    
    
}

extension MenuViewController: UITableViewDelegate {
    
}
