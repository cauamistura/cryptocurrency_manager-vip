//
//  CryptoCurrenciesError.swift
//  cryptocurrency_manager
//
//  Created by Caua Mistura on 18/09/23.
//

import Foundation

enum CryptoCurrenciesError: Error {
    case internalServerError
    case badRequestError
    case notFoundError
    case undefinedError
    
    var errorDescription: String {
        switch self {
        case .internalServerError: return "Ocorreu um erro no servidor. Tente novamente mais tarde!"
        case .badRequestError: return "Sua requisicao não foi bem sucedida!"
        case .notFoundError: return "O serviço que voce esta buscando nåo existe!"
        case .undefinedError: return "Ocorreu um erro. Tente novamente mais tarde!"
        }
    }
}
