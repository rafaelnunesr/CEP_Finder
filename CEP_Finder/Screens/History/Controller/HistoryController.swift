//
//  HistoryController.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/16/21.
//

import Foundation

class HistoryController {
    
    // MARK: Components
    var coreData = CoreDataManager(addressData: nil)
    var arrayHistory: [CoreHistory]?
    var address: AddressCoreData?
    var quantityHistory: Int?
    
    // MARK: SaveNewAddress
    func saveNewAddress() {
        guard let _address = self.address else { return }
        self.coreData.addressData = _address
        self.coreData.persistCoreData(coreData: CoreData.history)
    }
    
    // MARK: DeleteSpecificAddress
    func deleteSpecificAddress(withIndex index: Int) {
        let zipCode = self.arrayHistory?[index].zipCode
        guard let _zipCode = zipCode else { return }
        self.coreData.deleteOneAddress(coreData: CoreData.history, zipCode: _zipCode)
    }
    
    // MARK: GetAllAddresses
    func getAllAddresses(completionHandler: @escaping (_ result: Bool)-> Void) {
        
        self.coreData.getAllAddresses(coreData: CoreData.history, completion: { (result, error) in
            guard let _result = result else {
                completionHandler(false)
                return
            }
            self.arrayHistory = _result as? [CoreHistory]
            self.quantityHistory = _result.count
            
            completionHandler(true)
        })
        
    }
    
    // MARK: DeleteAllAddresses
    func deleteAllAddresses() {
        self.coreData.deleteAllAddresses(coreData: CoreData.history)
    }
    
    // MARK: Quantity
    var quantity: Int {
        return self.arrayHistory?.count ?? 0
    }
    
}
