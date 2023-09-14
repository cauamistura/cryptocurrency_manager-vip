//
//  GlobalStore.swift
//  cryptocurrency_manager
//
//  Created by Caua Mistura on 13/09/23.
//

import Foundation

protocol GlobalStoreProtool: GenericStoreProtocol {
    func fetchGlobal(completion: @escaping completion<GlobalModel?>)
}

class GlobalStore: GenericStoreRequest, GlobalStoreProtool {
    func fetchGlobal(completion: @escaping completion<GlobalModel?>) {
        do {
            guard let url = try GlobalRouter.global.asURLRequest() else {return completion(nil, error)}
            
            request(url: url, completion: completion)
        } catch let error {
            completion(nil, error)
        }
    }
}
