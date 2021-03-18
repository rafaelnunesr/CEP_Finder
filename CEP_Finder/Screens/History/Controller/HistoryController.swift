//
//  HistoryController.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/16/21.
//

import Foundation

class HistoryController {
    
    var coreData = CoreDataManager(data: nil)
    var arrayHistory: [CoreAddresses]?
    var address: AddressCoreData?
    var quantityHistory: Int?
    
    func saveNewAddress() {
        guard let _address = self.address else { return }
        self.coreData.data = _address
        self.coreData.persistCoreDataAddresses()
    }
    
    func deleteSpecificAddress(withIndex index: Int) {
        let zipCode = self.arrayHistory?[index].zipCode
        guard let _zipCode = zipCode else { return }
        self.coreData.deleteOneAddress(zipCode: _zipCode)
    }
    
    func getAllAddresses(completionHandler: @escaping (_ result: Bool)-> Void) {
    
        self.coreData.getAllAddresses { (result, error) in
            
            guard let _result = result else {
                completionHandler(false)
                return
            }
            self.arrayHistory = _result
            self.quantityHistory = _result.count
            
            completionHandler(true)
        }
    }
    
    func deleteAllAddresses() {
        self.coreData.deleteAllAddresses()
    }
    
    var quantity: Int {
        return self.arrayHistory?.count ?? 0
    }
    
}
