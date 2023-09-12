//
//  CoinsRouter.swift
//  cryptocurrency_manager
//
//  Created by Caua Mistura on 11/09/23.
//

import Foundation

enum CoinsRouter {
    case coinsMarkets(currency: String, cryptoCurrency: [String]?, order: String, parPage: Int, page: Int, percentage: String)
    case coinsByIdMarkedChart(id: String, currency: String, from: String, to: String)
    case coinsByIdOhlc(id: String, currency: String, days : String)
    case coinsById(id: String)
}
