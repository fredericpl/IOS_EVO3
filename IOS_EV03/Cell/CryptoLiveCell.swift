//
//  CryptoLiveCell.swift
//  IOS_EV03
//
//  Created by Plancquet Frederic on 14/09/2022.
//

import UIKit
import SafariServices

protocol CryptoCellDelegate: AnyObject {
    func cryptoCellDidTap(coin: Coin)
}

class CryptoLiveCell: UITableViewCell {
    weak var delegate: CryptoCellDelegate?

    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var cryptoPerc: UILabel!
    @IBOutlet weak var cryptoValueLb: UILabel!
    @IBOutlet weak var cryptoNameLB: UILabel!
    @IBOutlet weak var cryptoNumbLb: UILabel!
    private var coin: Coin!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        cellView.layer.cornerRadius = 25
        cellView.clipsToBounds = true
        cryptoNumbLb.layer.cornerRadius = 20
        cryptoNumbLb.clipsToBounds = true
        
        
        

        // Configure the view for the selected state
    }
    
    func setupCell(coin: Coin) {
        self.coin = coin
        cryptoNameLB.text = coin.name
        if coin.changePercent24Hr.starts(with: "-") {
            cryptoPerc.textColor = .red
        } else {
            cryptoPerc.textColor = .green
        }
        cryptoPerc.text = coin.changePercent24Hr
        cryptoNumbLb.text = coin.rank
        
        
        
        let price = Double(coin.priceUsd)
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        let formattedPrice = formatter.string(from: price as! NSNumber)
        
        cryptoValueLb.text = formattedPrice
    
    }
  
    
    @IBAction func didClickinfo(_ sender: Any) {
        
        delegate?.cryptoCellDidTap(coin: coin)
        
    }

        }
    
    

