//
//  CurrencyTableViewCell.swift
//  AdvancedApiMVVM
//
//  Created by ERASOFT on 19/05/22.
//

import UIKit

class CurrencyTableViewCell: UITableViewCell {

    
    @IBOutlet weak var currencyRateButton: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
