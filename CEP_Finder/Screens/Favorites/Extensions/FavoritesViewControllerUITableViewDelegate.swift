//
//  FavoritesViewController.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/15/21.
//

import UIKit

extension FavoritesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
