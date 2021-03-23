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

enum CoreData: String {
    case history = "CoreHistory"
    case favorites = "CoreFavorites"
}

struct CoreDataManager {

    // MARK: Components
    var addressData: AddressCoreData?

    typealias completion <T> = (_ result: T, _ failure: ErrorHandler?) -> Void
    
    // MARK: SetRequest
    private func setRequest(coreData: CoreData) -> NSFetchRequest<NSManagedObject> {
        let request = NSFetchRequest<NSManagedObject>(entityName: coreData.rawValue)
        request.returnsObjectsAsFaults = false
        return request
    }
    
    // MARK: GetAllAddresses
    func getAllAddresses(coreData: CoreData,completion: @escaping completion<[NSManagedObject]?>) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            let addresses = try context.fetch(self.setRequest(coreData: coreData))
            let result = addresses
            completion(result, nil)
        } catch  {
            completion(nil, ErrorHandler(title: "Error getting addresses from \(coreData.rawValue)", code: 400, errorDescription: error.localizedDescription))
        }
    }
    
    // MARK: GetAddressByZipCodeCoreHistory
    func getAddressByZipCode(coreData: CoreData, zipCode: String) -> NSManagedObject? {

        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = self.setRequest(coreData: coreData)
        request.predicate = NSPredicate(format: "zipCode == %@", zipCode)

        do {
            let addresses = try context.fetch(request)
            let result = addresses
            return result.first ?? nil
        } catch  {
            print("Error getting Address By ZipCode \(coreData.rawValue): \(error.localizedDescription)")
        }

        return nil
    }
    
    // MARK: PersistCoreData
    func persistCoreData(coreData: CoreData) {

        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        if let address = self.getAddressByZipCode(coreData: coreData, zipCode: self.addressData?.zipCode ?? "") {
            self.setValueCoreData(address: address)

        }else {
            
            var address: NSManagedObject?
            
            switch coreData {
            case .history:
                address = CoreHistory(context: context)
            case .favorites:
                address = CoreFavorites(context: context)
            }

            if self.addressData != nil {
                guard let _address = address else { return }
                self.setValueCoreData(address: _address)
            }

            do {
                try context.save()
            } catch {
                print("Error saving address to \(coreData.rawValue) \(error)")
            }
        }
    }
    
    // MARK: SetValueCoreData
    private func setValueCoreData(address: NSManagedObject) {
        address.setValue(self.addressData?.zipCode, forKey: CoreDataKeys.zipCode.rawValue)
        address.setValue(self.addressData?.streeName, forKey: CoreDataKeys.streetName.rawValue)
        address.setValue(self.addressData?.cityState, forKey: CoreDataKeys.cityState.rawValue)
        address.setValue(self.addressData?.latitude, forKey: CoreDataKeys.latitude.rawValue)
        address.setValue(self.addressData?.longitude, forKey: CoreDataKeys.longitude.rawValue)
    }
    
    // MARK: DeleteOneAddressFromHistory
    func deleteOneAddress(coreData: CoreData, zipCode: String) {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let request = self.setRequest(coreData: coreData)
        request.predicate = NSPredicate(format: "zipCode == %@", zipCode)

        do {
            let address = try context.fetch(request)
            context.delete(address.first!)
        } catch  {
            print("Error getting bank from CoreAddresses \(error)")
        }
    }
    
    // MARK: DeleteAllAddresses
    func deleteAllAddresses(coreData: CoreData) {

        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: coreData.rawValue)
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)

        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print ("There was an error")
        }
    }

}
