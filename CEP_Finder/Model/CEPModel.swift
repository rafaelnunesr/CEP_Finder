//
//  CEPModel.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/12/21.
//

import Foundation

struct CEP: Codable {
    let cep: String
    let logradouro: String
    let complemento: String
    let bairro: String
    let localidade: String
    let uf: String
    let ibge: String
    let gia: String
    let ddd: String
    let siafi: String
}
