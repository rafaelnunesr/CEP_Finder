//
//  Address.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/13/21.
//

import Foundation

struct Address {
    var logradouro: String
    private var localidade: String
    private var uf: String
    
    init(logradouro: String, localidade: String, uf: String) {
        self.logradouro = logradouro
        self.localidade = localidade
        self.uf = uf
    }
    
    var cityState: String {
        return self.localidade + " / " + self.uf
    }
}
