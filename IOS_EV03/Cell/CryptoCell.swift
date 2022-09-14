//
//  CryptoCell.swift
//  IOS_EV03
//
//  Created by Plancquet Frederic on 14/09/2022.
//

import UIKit

class CryptoCell: UITableViewCell {

    @IBOutlet weak var cryptoNameLB: UILabel!
    @IBOutlet weak var cryptoImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setupCell(detail: Coins) {
       
        cryptoNameLB.text = detail.id
        cryptoImg.af.setImage(withURL: URL(string: detail.icon)!)
    
    }
    
}
