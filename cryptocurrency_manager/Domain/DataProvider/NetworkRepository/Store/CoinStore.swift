//
//  CoinStore.swift
//  cryptocurrency_manager
//
//  Created by Caua Mistura on 13/09/23.
//

import Foundation

protocol CoinsStoreProtocol: GenericStoreProtocol {
    func fetchListCoins(
        by vsCurrency: String,
        with cryptocurrency: [String]?,
        orderBy order: String,
        totalPerPage: Int,
        page: Int,
        percentagePrice: String,
        completion: @escaping completion<CoinModel?>
    )

    func fetchHistorical(
        by id: String,
        currency vsCurrency: String,
        from: String,
        to: String,
        completion: @escaping completion<MarketCharModel?>
    )

    func fetchHistorical(
        by id: String,
        currency vsCurrency: String,
        of days: String,
        completion: @escaping completion<GraphicDataModel?>
    )

    func fetchCoin(
        by id: String,
        completion: @escaping completion<CurrentModel?>
    )
}

class CoinsStore: GenericStoreRequest, CoinsStoreProtocol {
    func fetchListCoins(by vsCurrency: String, with cryptocurrency: [String]?, orderBy order: String, totalPerPage: Int, page: Int, percentagePrice: String, completion: @escaping completion<CoinModel?>) {
        do {
            guard let url = try CoinsRouter.coinsMarkets(currency: vsCurrency,
                                                         cryptoCurrency: cryptocurrency,
                                                         order: order,
                                                         parPage: totalPerPage,
                                                         page: page,
                                                         percentage: percentagePrice).asURLRequest() else {return completion(nil, error)}
            request(url: url, completion: completion)
        } catch let error {
            completion(nil, error)
        }
    }
    
    func fetchHistorical(by id: String, currency vsCurrency: String, from: String, to: String, completion: @escaping completion<MarketCharModel?>) {
        do {
            guard let url = try CoinsRouter.coinsByIdMarkedChart(id: id, currency: vsCurrency, from: from, to: to).asURLRequest() else {
                return completion(nil, error)
            }
            request(url: url, completion: completion)
        } catch let error {
            completion(nil, error)
        }
    }
    
    func fetchHistorical(by id: String, currency vsCurrency: String, of days: String, completion: @escaping completion<GraphicDataModel?>) {
        do {
            guard let url = try CoinsRouter.coinsByIdOhlc(id: id, currency: vsCurrency, days: days).asURLRequest() else {
                return completion(nil, error)
            }
            request(url: url, completion: completion)
        } catch let error {
            completion(nil, error)
        }
    }
    
    func fetchCoin(by id: String, completion: @escaping completion<CurrentModel?>) {
        do {
            guard let url = try CoinsRouter.coinsById(id: id).asURLRequest() else {
                return completion(nil, error)
            }
            request(url: url, completion: completion)
        } catch let error {
            completion(nil, error)
        }
    }
    
}
