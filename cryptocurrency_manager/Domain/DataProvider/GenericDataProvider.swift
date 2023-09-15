//
//  GenericDataProvider.swift
//  cryptocurrency_manager
//
//  Created by Caua Mistura on 11/09/23.
//

import Foundation

protocol GenericDataProviderDelegate {
    func succes(model: Any)
    func errorData(_ provider: GenericDataProviderDelegate?, error: Error)
}

class DataProviderManager<T, S> {
    var delegate: T?
    var model: S?
}
