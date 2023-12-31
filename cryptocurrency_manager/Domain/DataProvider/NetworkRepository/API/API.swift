//
//  API.swift
//  cryptocurrency_manager
//
//  Created by Caua Mistura on 11/09/23.
//

import Foundation

struct API {
    static let baseURL = "https://api.coingecko.com/api/v3"
    static let coinsMarkets = "/coins/markets"
    static let coinsByIdMarketChart = "/coins/%@/market_chart/range"
    static let coinsByOhlLc = "/coins/%@/ohlc"
    static let global = "/global"
    static let coinsById = "coins/%@"
}
