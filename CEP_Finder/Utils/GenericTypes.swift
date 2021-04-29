//
//  GenericTypes.swift
//  CEP_Finder
//
//  Created by Rafael Nunes Rios on 4/29/21.
//

import Foundation

struct GenericTypes {
    typealias completionWithBoolean = (_ result: Bool, _ error: ErrorHandler?) -> Void
    typealias completion <T> = (_ result: T, _ error: ErrorHandler?) -> Void
}
