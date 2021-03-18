//
//  FavoriteController.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/18/21.
//

import Foundation

class FavoriteController {
    
    var coreData = CoreDataManager(addressData: nil)
    
    var arrayFavorite: [CoreFavorites]?
    var address: AddressCoreData?
    var quantityHistory: Int?
    
    func saveNewAddress() {
        guard let _address = self.address else { return }
        self.coreData.addressData = _address
        self.coreData.persistCoreDataHistory()
    }
    
    func deleteSpecificAddress(withIndex index: Int) {
        let zipCode = self.arrayFavorite?[index].zipCode
        guard let _zipCode = zipCode else { return }
        self.coreData.deleteOneAddressFromHistory(zipCode: _zipCode)
    }
    
    func getAllAddresses(completionHandler: @escaping (_ result: Bool)-> Void) {
    
        self.coreData.getAllFavorites { (result, error) in
            
            guard let _result = result else {
                completionHandler(false)
                return
            }
            self.arrayFavorite = _result
            self.quantityHistory = _result.count
            
            completionHandler(true)
        }
    }
    
    func deleteAllAddresses() {
        self.coreData.deleteAllAddressesFromFavorites()
    }
    
    var quantity: Int {
        return self.arrayFavorite?.count ?? 0
    }
}
