//
//  CepWorker.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/13/21.
//

import Foundation

class CepWorker {
    
    typealias completion <T> = (_ result: T, _ failure: ErrorHandler?) -> Void
    
    var cep: String?
    
    func getAddress(completion: @escaping completion<CEP?>) {
        
        let session = URLSession.shared
        let url = URL(string: "https://viacep.com.br/ws/\(cep ?? "")/json/")
        
        guard let _url = url else { return }
        
        let task = session.dataTask(with: _url) { (data, response, error) in
            
            guard let _data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(CEP.self, from: _data)
                completion(result, nil)
            }catch {
                completion(nil, ErrorHandler(title: "Error getting data", code: nil, errorDescription: error.localizedDescription))
            }
            
        }
        task.resume()
        
    }
    
}
