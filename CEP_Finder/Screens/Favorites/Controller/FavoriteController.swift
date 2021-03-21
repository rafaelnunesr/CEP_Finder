//
//  FavoriteController.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/18/21.
//

import Foundation

class FavoriteController {
    
    // MARK: Components
    var coreData = CoreDataManager(addressData: nil)
    var arrayFavorite: [CoreFavorites]?
    var address: AddressCoreData?
    var quantityHistory: Int?
    
    // MARK: SaveNewAddress
    func saveNewAddress() {
        guard let _address = self.address else { return }
        self.coreData.addressData = _address
        self.coreData.persistCoreData(coreData: CoreData.favorites)
    }
    
    // MARK: DeleteSpecificAddress
    func deleteSpecificAddress(withIndex index: Int) {
        let zipCode = self.arrayFavorite?[index].zipCode
        guard let _zipCode = zipCode else { return }
        self.coreData.deleteOneAddress(coreData: CoreData.history, zipCode: _zipCode)
    }
    
    // MARK: GetAllAddresses
    func getAllAddresses(completionHandler: @escaping (_ result: Bool)-> Void) {
        
        self.coreData.getAllAddresses(coreData: CoreData.favorites) { (result, error) in
            guard let _result = result else {
                completionHandler(false)
                return
            }
            self.arrayFavorite = _result as? [CoreFavorites]
            self.quantityHistory = _result.count
            
            completionHandler(true)
        }
    }
    
    // MARK: DeleteAllAddresses
    func deleteAllAddresses() {
        self.coreData.deleteAllAddresses(coreData: CoreData.favorites)
    }
    
    // MARK: Quantity
    var quantity: Int {
        return self.arrayFavorite?.count ?? 0
    }
}
