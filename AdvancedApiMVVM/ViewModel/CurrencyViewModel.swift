//
//  CurrencyViewModel.swift
//  AdvancedApiMVVM
//
//  Created by ERASOFT on 19/05/22.
//

import Foundation

class CurrencyViewModel {
    
    //MARK: - Declare this array for storing data.
    var arrOfCurrency: [CurrencyApi] = []
    
    //MARK: - This variable will access the NetworkLayerFunction
    var callApi: WebServices = WebServices()
    
    //MARK: - This are the methods of Table View
    func numOfSection() -> Int {
        return arrOfCurrency.count
    }
    func numCellSection(index: Int) -> CurrencyApi {
        return arrOfCurrency[index]
    }
    
    //MARK: - In This we will call the currency Api
    func callTheCurrencyApi() {
        callApi.requestGetURL(enterURL: "https://open.er-api.com/v6/latest/USD") { (decoder, data) in
            do {
                let responseJson = try decoder.decode(CurrencyApi.self, from: data)
                self.arrOfCurrency = [responseJson]
                dump(self.arrOfCurrency)
            } catch {
                print(error.localizedDescription)
            }
        } failure: { (error) in
            print(error.localizedDescription)
        }
    }
}
