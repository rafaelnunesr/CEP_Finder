//
//  CepNetwork.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/13/21.
//

import Foundation

class CepNetwork {
    
    typealias completion <T> = (_ result: T, _ failure: ErrorHandler?) -> Void
    
    var zipCode: String?
    
    func getAddress(completion: @escaping completion<CepModel?>) {
        
        let session = URLSession.shared
        let url = URL(string: "https://viacep.com.br/ws/\(zipCode ?? "")/json/")
        
        guard let _url = url else { return }
        
        let task = session.dataTask(with: _url) { (data, response, error) in
            
            guard let _data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(CepModel.self, from: _data)
                completion(result, nil)
            }catch {
                completion(nil, ErrorHandler(title: "Error getting data", code: nil, errorDescription: error.localizedDescription))
            }
            
        }
        task.resume()
        
    }
    
}
