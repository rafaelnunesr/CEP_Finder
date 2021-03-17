//
//  HistoryViewControllerUITableViewDataSource.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/15/21.
//

import UIKit

extension HistoryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller?.quantity ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: HistoryTableViewCell.identifier, for: indexPath) as? HistoryTableViewCell
        
        cell?.cepLabel.label.text = controller?.arrayHistory[indexPath.row]?.zipCode
        
        cell?.addressLabel.label.text = controller?.arrayHistory[indexPath.row]?.cityState
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(white: 1, alpha: 0.6)
        cell?.selectedBackgroundView = backgroundView
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

}
