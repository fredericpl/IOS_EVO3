//
//  CryptoDetailController.swift
//  IOS_EV03
//
//  Created by Plancquet Frederic on 14/09/2022.
//

import UIKit
import Alamofire

class CryptoDetailController: UIViewController {
    
    var coin : Coin!
    var historic = [Log]()
    

    
    @IBOutlet weak var cryptoValueLb: UILabel!
    @IBOutlet weak var cryptoNameLb: UILabel!
    @IBOutlet weak var CryptoDetailTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        cryptoNameLb.text = coin.name
        
        let price = Double(coin.priceUsd)
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "USD"
        let formattedPrice = formatter.string(from: price as! NSNumber)
        cryptoValueLb.text = formattedPrice
        CryptoDetailTableView.dataSource = self
        CryptoDetailTableView.register(UINib(nibName: "CryptoDetailCell", bundle: nil), forCellReuseIdentifier: "CryptoDetailCell")
        CryptoDetailTableView.rowHeight = 60
        
        fetchCoin()
        
        
        

        // Do any additional setup after loading the view.
    }
    
    
    func fetchCoin() {
        AF.request("https://api.coincap.io/v2/assets/\(coin.id)/history?interval=d1").response { [weak self] dataResponse in
            guard let self = self else {return}
            
            switch dataResponse.result {
                
            case .success(let data) :
                guard let data = data else { return }
                    
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(Historic.self, from: data)
                    self.historic = response.data
                    
                    self.historic.reverse()
                    
                    self.CryptoDetailTableView.reloadData()
                    
                    
                    
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }

        }
    }
    

}

extension CryptoDetailController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        historic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoDetailCell", for: indexPath) as! CryptoDetailCell
        
        let historic = historic[indexPath.row]
        cell.setupCell(historic: historic)
        
        return cell
    }
    
    
}

