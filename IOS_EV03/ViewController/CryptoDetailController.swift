//
//  CryptoDetailController.swift
//  IOS_EV03
//
//  Created by Plancquet Frederic on 14/09/2022.
//

import UIKit

class CryptoDetailController: UIViewController {
    
    var coin : Coin!

    @IBOutlet weak var cryptoValueLb: UILabel!
    @IBOutlet weak var cryptoNameLb: UILabel!
    @IBOutlet weak var CryptoDetailTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cryptoNameLb.text = coin.name
        cryptoValueLb.text = "\(coin.priceUsd) $"

        // Do any additional setup after loading the view.
    }
    

}

extension CryptoDetailController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        coin.
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
    
}

