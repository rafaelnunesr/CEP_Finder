//
//  MenuViewController.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/12/21.
//

import UIKit

class MenuViewController: UITableViewController {
    
    let menuItens = ["Favorites", "History", "About"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = Colors.lightOrange
        
        self.tableView.register(MenuTableViewCell.nib(), forCellReuseIdentifier: MenuTableViewCell.identifier)
        self.tableView.separatorStyle = .none
        
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItens.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuTableViewCell.identifier, for: indexPath) as? MenuTableViewCell
        
        cell?.cellLabel.text = menuItens[indexPath.row]
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(white: 1, alpha: 0.3)
        cell?.selectedBackgroundView = backgroundView
        
        return cell ?? UITableViewCell()
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        switch indexPath.row {
        case 0:
            let vc = FavoritesViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        case 1:
            let vc = HistoryViewController()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        case 2:
            let vc = AboutViewController()
            present(vc, animated: true)
        default:
            return
        }
        
    }

}

