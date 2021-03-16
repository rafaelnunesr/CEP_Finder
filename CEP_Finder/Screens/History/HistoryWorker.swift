//
//  HistoryWorker.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/15/21.
//

import UIKit
import CoreData

class HistoryWorker {
    
    var cepp: String = ""
    var logradouro: String = ""
    var city_state: String = ""
    
    func getHistory() -> History? {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        let request: NSFetchRequest<History> = History.fetchRequest()
        request.returnsObjectsAsFaults = false
        
        do {
            let ceps = try context.fetch(request)
            return ceps.first ?? nil
        } catch  {
            print("Error getting bank from CoreBank \(error)")
        }
        
        return nil
    }
    
    func persistCoreData() {
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

            if let address = self.getHistory() {
                
                address.setValue(self.cepp, forKey: "cep")
                
            }else {
                
                let address = History(context: context)
                
                if self.cepp != nil {
                    address.cep = self.cepp
                    address.logradouro = self.logradouro
                    address.city_state = self.city_state
                }
                
                do {
                    try context.save()
                } catch {
                    print("erro ao salvar o usuario \(error)")
                }
            }
            
        }
}
