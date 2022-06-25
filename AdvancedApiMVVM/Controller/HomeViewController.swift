//
//  HomeViewController.swift
//  AdvancedApiMVVM
//
//  Created by ERASOFT on 19/05/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var currencyTableView: UITableView!
    var businessFile: CurrencyViewModel = CurrencyViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currencyTableView.register(UINib(nibName: "CurrencyTableViewCell", bundle: nil), forCellReuseIdentifier: "CurrencyTableViewCell")
        businessFile.callTheCurrencyApi()
        
        DispatchQueue.main.async {
            self.currencyTableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return businessFile.numOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CurrencyTableViewCell", for: indexPath) as! CurrencyTableViewCell
        let stringRates = String((businessFile.numCellSection(index: indexPath.section).rates?.aED) ?? 0)
        cell.currencyRateButton.setTitle(stringRates, for: .normal)
        return cell
    }
}


