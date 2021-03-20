//
//  HistoryViewControllerUITableViewDelegate.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/15/21.
//

import UIKit

extension HistoryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let zipCode = controller.arrayHistory?[indexPath.row].zipCode ?? ""
        let streetName = controller.arrayHistory?[indexPath.row].streetName ?? ""
        let cityState = controller.arrayHistory?[indexPath.row].cityState ?? ""
        let latitude = controller.arrayHistory?[indexPath.row].latitude ?? 0
        let longitude = controller.arrayHistory?[indexPath.row].latitude ?? 0
        
        let address: AddressCoreData = AddressCoreData(zipCode: zipCode, streeName: streetName, cityState: cityState, latitude: latitude, longitude: longitude)
    
        self.showAddress(address: address)
    }
    
    func showAddress(address: AddressCoreData) {
        dismiss(animated: true) {
            NotificationCenter.default.post(name: Notification.Name("showSavedAddress"), object: address)
        }
    }
    
}
