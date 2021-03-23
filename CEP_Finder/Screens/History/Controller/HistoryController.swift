//
//  HistoryController.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/16/21.
//

import Foundation

class HistoryController {
    
    // MARK: Components
    var historyCoreData = CoreDataManager(addressData: nil)
    var arrayHistory: [CoreHistory]?
    var historyAddress: AddressCoreData?
    var quantityHistory: Int?
    
    // MARK: SaveNewAddress
    func saveNewAddressToHistory() {
        guard let _address = self.historyAddress else { return }
        self.historyCoreData.addressData = _address
        self.historyCoreData.persistCoreData(coreData: CoreData.history)
    }
    
    // MARK: DeleteSpecificAddress
    func deleteSpecificHistoryAddress(withIndex index: Int) {
        let zipCode = self.arrayHistory?[index].zipCode
        guard let _zipCode = zipCode else { return }
        self.historyCoreData.deleteOneAddress(coreData: CoreData.history, zipCode: _zipCode)
    }
    
    // MARK: GetAllAddresses
    func getAllHistoryAddresses(completionHandler: @escaping (_ result: Bool)-> Void) {
        
        self.historyCoreData.getAllAddresses(coreData: CoreData.history, completion: { (result, error) in
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
    func deleteAllHistoryAddresses() {
        self.historyCoreData.deleteAllAddresses(coreData: CoreData.history)
    }
    
    // MARK: Quantity
    var historyQuantity: Int {
        return self.arrayHistory?.count ?? 0
    }
    
}
