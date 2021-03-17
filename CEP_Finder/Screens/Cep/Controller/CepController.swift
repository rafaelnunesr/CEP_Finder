//
//  CepController.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/16/21.
//

import Foundation

class CepController {
    
    private var coreData = CoreDataManager(data: nil)
    var arrayHistory: [CoreHistory?] = []
    var address: AddressCoreData? = nil
    
    func addNewAddressToHistory() {
        guard let _address = self.address else { return }
        self.coreData.data = _address
        self.coreData.persistCoreDataHistory()
    }
    
}
