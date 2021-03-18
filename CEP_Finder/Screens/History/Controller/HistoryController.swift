//
//  HistoryController.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/16/21.
//

import Foundation

class HistoryController {
    
    var coreData = CoreDataManager(data: nil)
    var arrayHistory: [CoreHistory]?
    var quantity: Int = 0
    var address: AddressCoreData?
    
    func saveNewAddress() {
        guard let _address = self.address else { return }
        self.coreData.data = _address
        self.coreData.persistCoreDataHistory()
    }
    
    func deleteSpecificAddress() {
        guard let _address = self.address else { return }
        self.coreData.deleteElementHistory(zipCode: _address.zipCode)
        
    }
    
    func getAllAddresses(completionHandler: @escaping (_ result: Bool)-> Void) {
    
        self.coreData.getAllHistory { (result, error) in
            
            guard let _result = result else {
                completionHandler(false)
                return
            }
            self.arrayHistory = _result
            self.quantity = _result.count
            
            completionHandler(true)
        }
    }
    
    func deleteAllAddresses() {
        self.coreData.deleteAllHistory()
    }
    
}
