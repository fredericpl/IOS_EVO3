//
//  CryptoLiveController.swift
//  IOS_EV03
//
//  Created by Plancquet Frederic on 14/09/2022.
//

import UIKit
import Alamofire
import AlamofireImage
import Network
import SafariServices

class CryptoLiveController: UIViewController {
    
    
    @IBOutlet weak var CryptoLiveTableView: UITableView!
    @IBOutlet weak var SortedCryptoSegmented: UISegmentedControl!
    
    let coinApi = "https://api.coincap.io/v2/assets"
    var coins = [Coin]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        CryptoLiveTableView.delegate = self
        CryptoLiveTableView.dataSource = self
        CryptoLiveTableView.register(UINib(nibName: "CryptoLiveCell", bundle: nil), forCellReuseIdentifier: "CryptoLiveCell")
        
        CryptoLiveTableView.rowHeight = 100
        
        SortedCryptoSegmented.addTarget(self, action: #selector(segmentedCrytptoChanged), for: UIControl.Event.valueChanged)
        
        // fetchCoin()
        
        let refreshCrontol = UIRefreshControl()
        refreshCrontol.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshCrontol.addTarget(self, action: #selector(refreshData), for: .valueChanged)
        CryptoLiveTableView.refreshControl = refreshCrontol
        
        refreshData()
        
        
    }
    
    @objc
    func refreshData() {
        AF.request(coinApi).response { [weak self] dataResponse in
            guard let self = self else {return}
            
            switch dataResponse.result {
                
            case .success(let data) :
                guard let data = data else { return }
                    
                do {
                    let decoder = JSONDecoder()
                    let response = try decoder.decode(Data.self, from: data)
                    self.coins = response.data
                    self.CryptoLiveTableView.reloadData()
                    
                    
                    
                } catch {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }

        }
        self.CryptoLiveTableView.refreshControl?.endRefreshing()
    }
    
    
    @objc
    func segmentedCrytptoChanged(_ sender: UISegmentedControl) {
        if sender .selectedSegmentIndex == 0 {
            
        } else if sender .selectedSegmentIndex == 1 {
            
        } else {
            
        }
    }
    
    }


    

    
    
    func fetchCoin() {
      


}


extension CryptoLiveController: UITableViewDataSource, UITableViewDelegate {
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        coins.count
        
}
    
    

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "CryptoLiveCell", for: indexPath) as! CryptoLiveCell
        
        
        let coin = coins[indexPath.row]
        cell.setupCell(coin: coin)
        
        cell.delegate = self
        
        return cell
}
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "CryptoDetailController") as! CryptoDetailController
        vc.coin = coins[indexPath.row]
       // self.present(vc, animated: true, completion: nil)
        navigationController?.pushViewController(vc, animated: true)
        

        
       
        
        
    }

}

extension CryptoLiveController: CryptoCellDelegate {
    func cryptoCellDidTap(coin: Coin) {
        if let url = URL(string: "https://www.google.fr/"){
            let vc = SFSafariViewController(url: url)
            present(vc, animated: true)
            
    }
}

}
