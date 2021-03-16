//
//  HistoryWorker.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/15/21.
//

import UIKit
import CoreData

class HistoryWorker {
    
    var zipCode: String = ""
    var streetName: String = ""
    var cityState: String = ""
    
    func getHistory() -> CoreHistory? {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let request: NSFetchRequest<CoreHistory> = CoreHistory.fetchRequest()
        request.returnsObjectsAsFaults = false
        
        do {
            let addresses = try context.fetch(request)
            return addresses.first ?? nil
        } catch  {
            print("Error getting bank from CoreHistory \(error)")
        }
        
        return nil
    }
    
    func persistCoreData() {
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

            if let address = self.getHistory() {
                
                address.setValue(self.zipCode, forKey: "zipCode")
                
            }else {
                
                let address = CoreHistory(context: context)
                
                if self.zipCode != nil {
                    address.zipCode = self.zipCode
                    address.streetName = self.streetName
                    address.cityState = self.cityState
                }
                
                do {
                    try context.save()
                } catch {
                    print("Error saving address to CoreHistory \(error)")
                }
            }
            
        }
}
