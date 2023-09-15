//
//  ListCoinDataProvider.swift
//  cryptocurrency_manager
//
//  Created by Caua Mistura on 13/09/23.
//

import Foundation

protocol ListCoinDataProviderDelegate: GenericDataProviderDelegate {}

class ListCoinDataProvider: DataProviderManager<ListCoinDataProviderDelegate, [CoinModel]> {
    private let coinsStore: CoinsStoreProtocol?
    
    init(coinsStore : CoinsStoreProtocol = CoinsStore()) {
        self.coinsStore = coinsStore
    }
    
    func fetchListCoins(by vsCurrency: String, with cryptocurrency: [String]?, orderBy order: String, totalPerPage: Int,
                        page: Int, percentagePrice: String) {
        
        coinsStore?.fetchListCoins(by: vsCurrency,
                                   with: cryptocurrency,
                                   orderBy: order,
                                   totalPerPage: totalPerPage,
                                   page: page,
                                   percentagePrice: percentagePrice,
                                   completion: { result, error in
            if let error {
                self.delegate?.errorData(self.delegate, error: error)
            }
            
            if let result {
                self.delegate?.succes(model: result)
            }
        })
    }
}
