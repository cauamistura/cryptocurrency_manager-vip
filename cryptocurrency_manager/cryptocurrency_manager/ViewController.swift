//
//  ViewController.swift
//  cryptocurrency_manager
//
//  Created by Caua Mistura on 11/09/23.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
        let dataProvider = ListCoinDataProvider()
        dataProvider.delegate = self
        dataProvider.fetchListCoins(by: "brl", with: nil, orderBy: "market_cap_desc", totalPerPage: 10, page: 1, percentagePrice: "1h")
    }
}

extension ViewController: ListCoinDataProviderDelegate {
    func succes(model: Any) {
        let coinList = model as? [CoinModel]
        print(coinList ?? "Empty")
    }
    
    func errorData(_ provider: GenericDataProviderDelegate?, error: Error) {
        print(error.localizedDescription)
    }
    
}

