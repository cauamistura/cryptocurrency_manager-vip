//
//  GlobalValuesDataProvider.swift
//  cryptocurrency_manager
//
//  Created by Caua Mistura on 14/09/23.
//

import Foundation

protocol GlobalValuesDataProviserDelegate: GenericDataProviderDelegate {}

class GlobalValuesDataProvider: DataProviderManager<GlobalValuesDataProviserDelegate, GlobalModel> {
    private let globalStore: GlobalStoreProtool?
    
    init(globalStore: GlobalStoreProtool = GlobalStore()) {
        self.globalStore = globalStore
    }
    
    func fetchGlobalValues() {
        globalStore?.fetchGlobal(completion: { result, error in
            if let error {
                self.delegate?.errorData(self.delegate, error: error)
            }
            
            if let result {
                self.delegate?.succes(model: result)
            }
        })
    }
}
