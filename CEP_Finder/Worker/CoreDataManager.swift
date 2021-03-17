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
}

struct CoreDataManager {
    
    var data: AddressCoreData?
    
    func getAllHistory() -> [CoreHistory]? {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let request: NSFetchRequest<CoreHistory> = CoreHistory.fetchRequest()
        request.returnsObjectsAsFaults = false
        
        do {
            let addresses = try context.fetch(request)
            return addresses
        } catch  {
            print("Error getting bank from CoreHistory \(error)")
        }
        
        return nil
    }
    
    func getElementHistory(zipCode: String) -> CoreHistory? {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let request: NSFetchRequest<CoreHistory> = CoreHistory.fetchRequest()
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
    
    func persistCoreDataHistory() {
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        if let address = self.getElementHistory(zipCode: self.data?.zipCode ?? "") {
                
                address.setValue(self.data?.zipCode, forKey: "zipCode")
                address.setValue(self.data?.streeName, forKey: "streetName")
                address.setValue(self.data?.cityState, forKey: "cityState")
                
            }else {
                
                let address = CoreHistory(context: context)
                
                if self.data != nil {
                    address.zipCode = self.data?.zipCode
                    address.streetName = self.data?.streeName
                    address.cityState = self.data?.cityState
                }
                
                do {
                    try context.save()
                } catch {
                    print("Error saving address to CoreHistory \(error)")
                }
            }
            
        }
    
    func deleteElementHistory(zipCode: String) -> Bool {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let request: NSFetchRequest<CoreHistory> = CoreHistory.fetchRequest()
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "zipCode == %@", zipCode)
        
        do {
            let address = try context.fetch(request)
            context.delete(address.first!)
            return true
        } catch  {
            print("Error getting bank from CoreHistory \(error)")
            return false
        }
    }
    
    func deleteAllHistory() -> Bool {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "CoreHistory")
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
}

extension CoreDataManager {
    
    func getAllFavorites() -> [CoreFavorites]? {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let request: NSFetchRequest<CoreFavorites> = CoreFavorites.fetchRequest()
        request.returnsObjectsAsFaults = false
        
        do {
            let addresses = try context.fetch(request)
            return addresses
        } catch  {
            print("Error getting bank from CoreHistory \(error)")
        }
        
        return nil
    }
    
    func getElementFavorite(zipCode: String) -> CoreFavorites? {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let request: NSFetchRequest<CoreFavorites> = CoreFavorites.fetchRequest()
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
    
    func persistCoreDataFavorite() {
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        if let address = self.getElementFavorite(zipCode: self.data?.zipCode ?? "") {
                
                address.setValue(self.data?.zipCode, forKey: "zipCode")
                address.setValue(self.data?.streeName, forKey: "streetName")
                address.setValue(self.data?.cityState, forKey: "cityState")
                
            }else {
                
                let address = CoreFavorites(context: context)
                
                if self.data != nil {
                    address.zipCode = self.data?.zipCode
                    address.streetName = self.data?.streeName
                    address.cityState = self.data?.cityState
                }
                
                do {
                    try context.save()
                } catch {
                    print("Error saving address to CoreHistory \(error)")
                }
            }
            
        }
    
    func deleteElementFavorite(zipCode: String) -> Bool {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let request: NSFetchRequest<CoreFavorites> = CoreFavorites.fetchRequest()
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "zipCode == %@", zipCode)
        
        do {
            let address = try context.fetch(request)
            context.delete(address.first!)
            return true
        } catch  {
            print("Error getting bank from CoreHistory \(error)")
            return false
        }
    }
    
    func deleteAllFavorites() -> Bool {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "CoreFavorites")
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
}
