//
//  CoreDataManager.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/15/21.
//

import UIKit
import CoreData

struct AddressCoreData {
    let zipCode: String
    let streeName: String
    let cityState: String
    var isFavorite: Bool
}

struct CoreDataManager {
    
    var data: AddressCoreData?
    
    func getAllAddresses(completion: @escaping (_ result: [CoreAddresses]?, _ error: ErrorHandler?) -> Void) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let request: NSFetchRequest<CoreAddresses> = CoreAddresses.fetchRequest()
        request.returnsObjectsAsFaults = false
        
        do {
            let addresses = try context.fetch(request)
            completion(addresses.reversed(), nil)
        } catch  {
            completion(nil, ErrorHandler(title: "Error getting addresses", code: 400, errorDescription: error.localizedDescription))
        }
    }
    
    func getAddressByZipCode(zipCode: String) -> CoreAddresses? {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let request: NSFetchRequest<CoreAddresses> = CoreAddresses.fetchRequest()
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "zipCode == %@", zipCode)
        
        do {
            let addresses = try context.fetch(request)
            return addresses.first ?? nil
        } catch  {
            print("Error getting bank from CoreHistory \(error)")
        }
        
        return nil
    }
    
    func persistCoreDataAddresses() {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        if let address = self.getAddressByZipCode(zipCode: self.data?.zipCode ?? "") {
            
            address.setValue(self.data?.zipCode, forKey: "zipCode")
            address.setValue(self.data?.streeName, forKey: "streetName")
            address.setValue(self.data?.cityState, forKey: "cityState")
            address.setValue(self.data?.isFavorite, forKey: "isFavorite")
            
            print(self.data?.isFavorite)
            
        }else {
            
            let address = CoreAddresses(context: context)

            if self.data != nil {
                address.zipCode = self.data?.zipCode
                address.streetName = self.data?.streeName
                address.cityState = self.data?.cityState
                address.isFavorite = self.data?.isFavorite ?? false
                
            }

            do {
                try context.save()
            } catch {
                print("Error saving address to CoreHistory \(error)")
            }
        }
        
    }
    
    func deleteOneAddress(zipCode: String) -> Bool {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let request: NSFetchRequest<CoreAddresses> = CoreAddresses.fetchRequest()
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "zipCode == %@", zipCode)
        
        do {
            let address = try context.fetch(request)
            context.delete(address.first!)
            return true
        } catch  {
            print("Error getting bank from CoreAddresses \(error)")
            return false
        }
    }
    
    func deleteAllAddresses() -> Bool {

        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "CoreAddresses")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        
        do {
            try context.execute(deleteRequest)
            try context.save()
            return true
        } catch {
            print ("There was an error")
            return false
        }

    }
    
    mutating func updateFavoriteAddressStatus() {
        if self.data?.isFavorite == true {
            let newData = data
            data = AddressCoreData(zipCode: newData?.zipCode ?? "", streeName: newData?.streeName ?? "", cityState: newData?.cityState ?? "", isFavorite: false)
        }else {
            let newData = data
            data = AddressCoreData(zipCode: newData?.zipCode ?? "", streeName: newData?.streeName ?? "", cityState: newData?.cityState ?? "", isFavorite: true)
        }
        
        self.persistCoreDataAddresses()
    }
    
}
