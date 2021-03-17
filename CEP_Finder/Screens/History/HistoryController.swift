//
//  HistoryController.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/16/21.
//

import Foundation

struct HistoryController {
    
    var coreData = CoreDataManager(data: nil)
    var arrayHistory: [CoreHistory?]
    var quantity: Int = 0
    var address: AddressCoreData?
    
    mutating func saveNewAddress() {
        
        guard let _address = self.address else { return }
        self.coreData.data = _address
        self.coreData.persistCoreDataHistory()
        
    }
    
    func deleteSpecificAddress() {
        guard let _address = self.address else { return }
        self.coreData.deleteElementHistory(zipCode: _address.zipCode)
        
    }
    
    mutating func getAllAddresses() {
        
        guard let addresses = self.coreData.getAllHistory() else { return }
        self.arrayHistory = addresses
        self.quantity = addresses.count
        
    }
    
}
