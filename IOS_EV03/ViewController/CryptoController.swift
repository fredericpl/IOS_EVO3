//
//  CryptoController.swift
//  IOS_EV03
//
//  Created by Plancquet Frederic on 14/09/2022.
//

import UIKit
import Alamofire
import AlamofireImage

class CryptoController: UIViewController {

    
    let coinApi = "https://api.coinstats.app/public/v1/coins?skip=0&limit=50&currency=EUR"
    var detail = [Coins]()
    @IBOutlet weak var CryptoTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CryptoTableView.delegate = self
        CryptoTableView.dataSource = self
        CryptoTableView.register(UINib(nibName: "CryptoCell", bundle: nil), forCellReuseIdentifier: "CryptoCell")
        CryptoTableView.rowHeight = 300

        fetchCoin()
    }
    
    
    
    func fetchCoin() {
        AF.request(coinApi).response { [weak self] dataResponse in
            guard let self = self else {return}
            
            switch dataResponse.result {
                
            case .success(let data) :
                guard let data = data else { return }
                    
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(CoinImg.self, from: data)
                    self.detail = response.coins
                    self.CryptoTableView.reloadData()
                    
                    
                    
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }

        }
    }
    


}

extension CryptoController: UITableViewDataSource, UITableViewDelegate {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        detail.count
        
}
    
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoCell", for: indexPath) as! CryptoCell
        
        
        let detail = detail[indexPath.row]
        cell.setupCell(detail: detail)
        
        return cell

    }
}
