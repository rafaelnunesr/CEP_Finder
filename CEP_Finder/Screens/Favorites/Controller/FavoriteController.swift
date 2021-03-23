//
//  FavoriteController.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/18/21.
//

import Foundation

class FavoriteController {
    
    // MARK: Components
    var favoritesCoreData = CoreDataManager(addressData: nil)
    var arrayFavorite: [CoreFavorites]?
    var favoriteAddress: AddressCoreData?
    var quantityFavorites: Int?
    
    // MARK: SaveNewAddress
    func saveNewFavoriteAddress() {
        guard let _address = self.favoriteAddress else { return }
        self.favoritesCoreData.addressData = _address
        self.favoritesCoreData.persistCoreData(coreData: CoreData.favorites)
    }
    
    // MARK: DeleteSpecificAddress
    func deleteSpecificFavoriteAddress(withIndex index: Int) {
        let zipCode = self.arrayFavorite?[index].zipCode
        guard let _zipCode = zipCode else { return }
        self.favoritesCoreData.deleteOneAddress(coreData: CoreData.favorites, zipCode: _zipCode)
    }
    
    // MARK: GetAllAddresses
    func getAllFavoriteAddresses(completionHandler: @escaping (_ result: Bool)-> Void) {
        
        self.favoritesCoreData.getAllAddresses(coreData: CoreData.favorites) { (result, error) in
            guard let _result = result else {
                completionHandler(false)
                return
            }
            self.arrayFavorite = _result as? [CoreFavorites]
            self.quantityFavorites = _result.count
            
            completionHandler(true)
        }
    }
    
    // MARK: DeleteAllAddresses
    func deleteAllFavoriteAddresses() {
        self.favoritesCoreData.deleteAllAddresses(coreData: CoreData.favorites)
    }
    
    // MARK: Quantity
    var favoriteQuantity: Int {
        return self.arrayFavorite?.count ?? 0
    }
}
