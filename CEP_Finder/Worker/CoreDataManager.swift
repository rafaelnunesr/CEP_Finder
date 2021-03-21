//
//  CoreDataManager.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/15/21.
//

import UIKit
import CoreData

enum CoreDataKeys: String {
    case zipCode = "zipCode"
    case streetName = "streetName"
    case cityState = "cityState"
    case latitude = "latitude"
    case longitude = "longitude"
}

struct CoreDataManager {
    
    // MARK: Components
    var addressData: AddressCoreData?
    
    typealias completion <T> = (_ result: T, _ failure: ErrorHandler?) -> Void    
    
    // MARK: GetAllHistory
    func getAllHistory(completion: @escaping completion<[CoreHistory]?>) {

        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request: NSFetchRequest<CoreHistory> = CoreHistory.fetchRequest()
        request.returnsObjectsAsFaults = false

        do {
            let addresses = try context.fetch(request)
            completion(addresses.reversed(), nil)
        } catch  {
            completion(nil, ErrorHandler(title: "Error getting addresses from CoreHistory", code: 400, errorDescription: error.localizedDescription))
        }
    }
    
    // MARK: GetAllFavorites
    func getAllFavorites(completion: @escaping completion<[CoreFavorites]?>) {

        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request: NSFetchRequest<CoreFavorites> = CoreFavorites.fetchRequest()
        request.returnsObjectsAsFaults = false

        do {
            let addresses = try context.fetch(request)
            completion(addresses.reversed(), nil)
        } catch  {
            completion(nil, ErrorHandler(title: "Error getting addresses from CoreFavorites", code: 400, errorDescription: error.localizedDescription))
        }
    }

    
    // MARK: GetAddressByZipCodeCoreHistory
    func getAddressByZipCodeCoreHistory(zipCode: String) -> CoreHistory? {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request: NSFetchRequest<CoreHistory> = CoreHistory.fetchRequest()
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "zipCode == %@", zipCode)
        
        do {
            let addresses = try context.fetch(request)
            return addresses.first ?? nil
        } catch  {
            print("Error getting Address By ZipCode CoreHistory: \(error.localizedDescription)")
        }
        
        return nil
    }
    
    // MARK: GetAddressByZipCodeCoreFavorites
    func getAddressByZipCodeCoreFavorites(zipCode: String) -> CoreFavorites? {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request: NSFetchRequest<CoreFavorites> = CoreFavorites.fetchRequest()
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "zipCode == %@", zipCode)
        
        do {
            let addresses = try context.fetch(request)
            return addresses.first ?? nil
        } catch  {
            print("Error getting Address By ZipCode CoreFavorites: \(error.localizedDescription)")
        }
        
        return nil
    }
    
    // MARK: PersistCoreDataHistory
    func persistCoreDataHistory() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        if let address = self.getAddressByZipCodeCoreHistory(zipCode: self.addressData?.zipCode ?? "") {
            address.setValue(self.addressData?.zipCode, forKey: CoreDataKeys.zipCode.rawValue)
            address.setValue(self.addressData?.streeName, forKey: CoreDataKeys.streetName.rawValue)
            address.setValue(self.addressData?.cityState, forKey: CoreDataKeys.cityState.rawValue)
            address.setValue(self.addressData?.latitude, forKey: CoreDataKeys.latitude.rawValue)
            address.setValue(self.addressData?.longitude, forKey: CoreDataKeys.longitude.rawValue)

        }else {

            let address = CoreHistory(context: context)

            if self.addressData != nil {
                address.zipCode = self.addressData?.zipCode
                address.streetName = self.addressData?.streeName
                address.cityState = self.addressData?.cityState
                address.latitude = self.addressData?.latitude ?? 0
                address.longitude = self.addressData?.longitude ?? 0
            }

            do {
                try context.save()
            } catch {
                print("Error saving address to CoreHistory \(error)")
            }
        }
        
    }
    
    // MARK: PersistCoreDataFavorites
    func persistCoreDataFavorites() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        if let address = self.getAddressByZipCodeCoreFavorites(zipCode: self.addressData?.zipCode ?? "") {
            address.setValue(self.addressData?.zipCode, forKey: CoreDataKeys.zipCode.rawValue)
            address.setValue(self.addressData?.streeName, forKey: CoreDataKeys.streetName.rawValue)
            address.setValue(self.addressData?.cityState, forKey: CoreDataKeys.cityState.rawValue)
            address.setValue(self.addressData?.latitude, forKey: CoreDataKeys.latitude.rawValue)
            address.setValue(self.addressData?.longitude, forKey: CoreDataKeys.longitude.rawValue)

        }else {

            let address = CoreFavorites(context: context)

            if self.addressData != nil {
                address.zipCode = self.addressData?.zipCode
                address.streetName = self.addressData?.streeName
                address.cityState = self.addressData?.cityState
                address.latitude = self.addressData?.latitude ?? 0
                address.longitude = self.addressData?.longitude ?? 0
            }

            do {
                try context.save()
            } catch {
                print("Error saving address to CoreFavorites \(error)")
            }
        }
        
    }
    
    // MARK: DeleteOneAddressFromHistory
    func deleteOneAddressFromHistory(zipCode: String) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let request: NSFetchRequest<CoreHistory> = CoreHistory.fetchRequest()
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "zipCode == %@", zipCode)
        
        do {
            let address = try context.fetch(request)
            context.delete(address.first!)
        } catch  {
            print("Error getting bank from CoreAddresses \(error)")
        }
    }
    
    // MARK: DeleteOneAddressFromFavorites
    func deleteOneAddressFromFavorites(zipCode: String) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let request: NSFetchRequest<CoreFavorites> = CoreFavorites.fetchRequest()
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "zipCode == %@", zipCode)
        
        do {
            let address = try context.fetch(request)
            context.delete(address.first!)
        } catch  {
            print("Error getting bank from CoreFavorites \(error)")
        }
    }
    
    // MARK: DeleteAllAddresses
    func deleteAllAddressesFromHistory() {

        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "CoreHistory")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print ("There was an error")
        }

    }
    
    func deleteAllAddressesFromFavorites() {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "CoreFavorites")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print ("There was an error")
        }

    }
    
    // MARK: UpdateFavoriteAddressStatus
    mutating func updateFavoriteAddressStatus() {
        
//        if self.addressData?.isFavorite == true {
//            let newData = addressData
//            addressData = AddressCoreData(zipCode: newData?.zipCode ?? "", streeName: newData?.streeName ?? "", cityState: newData?.cityState ?? "", isFavorite: false)
//        }else {
//            let newData = addressData
//            addressData = AddressCoreData(zipCode: newData?.zipCode ?? "", streeName: newData?.streeName ?? "", cityState: newData?.cityState ?? "", isFavorite: true)
//        }
//
//        self.persistCoreDataAddresses()
    }
    
}
