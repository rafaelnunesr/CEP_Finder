//
//  FavoritesViewController.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/14/21.
//

import UIKit

class FavoritesViewController: AddressViewController {

    // MARK: Components
    var controller: FavoriteController = FavoriteController()
    
    // MARK: ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
    }
    
    // MARK: Setup
    private func setup() {
        self.loadFavoriteController()
        self.checkFavoriteItems()
        self.setupComponents()
    }
    
    // MARK: LoadHistoryController
    private func loadFavoriteController() {
        self.controller.getAllFavoriteAddresses(completionHandler: { (result) in
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
        self.header.titleLabel.text = "Favorites"
    }
    
    // MARK: ClearButtonTapped
    override func clearButtonTapped() {
        let alert = UIAlertController(title: "Delete All Favorites", message: "Are you sure you want to delete all your favorites Addresses?", preferredStyle: .alert)
        let deleteButton = UIAlertAction(title: "Delete", style: .destructive) { (UIAlertAction) in
            self.controller.deleteAllFavoriteAddresses()
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
    func checkFavoriteItems() {
        if self.controller.favoriteQuantity > 0 {
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
