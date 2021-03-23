//
//  HistoryViewControllerUITableViewDataSource.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/15/21.
//

import UIKit

extension HistoryViewController: UITableViewDataSource {
    
    // MARK: CanEditRowAt
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // MARK: EditingStyle
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        controller.deleteSpecificHistoryAddress(withIndex: indexPath.row)
        controller.arrayHistory?.remove(at: indexPath.row)
        self.tableView.deleteRows(at: [indexPath], with: .automatic)
        
        if self.controller.historyQuantity == 0 {
            checkHistoryItems()
        }
        
    }
    
    // MARK: NumberOfRowsInSection
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.historyQuantity
    }
    
    // MARK: CellForRowAt
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: AddressTableViewCell.identifier, for: indexPath) as? AddressTableViewCell
        
        cell?.cepLabel.label.text = controller.arrayHistory?[indexPath.row].zipCode
        
        let address = controller.arrayHistory?[indexPath.row].streetName ?? ""
        let cityState = controller.arrayHistory?[indexPath.row].cityState ?? ""
        
        cell?.addressLabel.label.text = "\(address), \(cityState)"
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(white: 1, alpha: 0.6)
        cell?.selectedBackgroundView = backgroundView
        
        return cell ?? UITableViewCell()
    }
    
    // MARK: HeightForRowAt
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
        
    }
    
}
