//
//  CepNetwork.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/13/21.
//

import Foundation

enum PersonalizedErrorDescription: String {
    case network = "It looks like you're offline. Please check your connection."
    case noZipCode = "Ops. The zip code doesn't exist. Please inform a valid zip code"
}


class CepNetwork {
    
    typealias completion <T> = (_ result: T, _ failure: ErrorHandler?) -> Void
    
    var zipCode: String?
    
    func checkNetworkStatus() -> Bool {
        if Reachability.isConnectedToNetwork(){
            return true
        }
        return false
    }
    
    func getAddress(completion: @escaping completion<CepModel?>) {
        
        if !self.checkNetworkStatus() {
            completion(nil, ErrorHandler(title: "Network error", code: 404, errorDescription: PersonalizedErrorDescription.network.rawValue))
        }
        
        let session = URLSession.shared
        let url = URL(string: "https://viacep.com.br/ws/\(zipCode ?? "")/json/")
        
        guard let _url = url else { return }
        
        let task = session.dataTask(with: _url) { (data, response, error) in
            
            guard let _data = data else { return }
            
            do {
                let result = try JSONDecoder().decode(CepModel.self, from: _data)
                completion(result, nil)
            }catch {
               
                if error.localizedDescription == "The data couldn’t be read because it is missing." {
                    completion(nil, ErrorHandler(title: "Invalid Zip Code", code: nil, errorDescription: PersonalizedErrorDescription.noZipCode.rawValue))
                }else {
                    completion(nil, ErrorHandler(title: "Error getting data", code: nil, errorDescription: error.localizedDescription))
                }
            }
        }
        task.resume()
        
    }
    
}
