//
//  ErrorHandler.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 3/13/21.
//

import Foundation

struct ErrorHandler {
    var title: String?
    var code: Int?
    var errorDescription: String?
    
    init(title: String?, code: Int?, errorDescription: String?) {
        self.title = title ?? "Error"
        self.code = code
        self.errorDescription = errorDescription
    }
    
    init() {}
}
