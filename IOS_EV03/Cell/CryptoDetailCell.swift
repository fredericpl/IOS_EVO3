//
//  CryptoDetailCell.swift
//  IOS_EV03
//
//  Created by Plancquet Frederic on 14/09/2022.
//

import UIKit

class CryptoDetailCell: UITableViewCell {

    @IBOutlet weak var dateLB: UILabel!
    @IBOutlet weak var valueLB: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(historic: Log ) {
        
        dateLB.text = historic.date
        
        let price = Double(historic.priceUsd)
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        let formattedPrice = formatter.string(from: price as! NSNumber)
        
        valueLB.text = formattedPrice
        
    }
    
}
