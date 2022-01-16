//
//  FavouritesVC.swift
//  DoRe
//
//  Created by Praveen Nirmal on 15/1/22.
//

import UIKit

class FavouritesVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var favourites: [Favourite] = [Favourite(thumbnail: UIImage(systemName: "music.quarternote.3")! , title: "item.title", album: "item.price", artist: "item.id")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        urlRequset()
        /// Setting delegates and Data Source to pass data to view without storyboard help
//        tableView.delegate = self
//        tableView.dataSource = self
    }
    
    /// Network requset for get products list
    func urlRequset() {
        guard let resourceURL = URL(string: "https://59b8726e92ccc3eb44b0c193eeef96f6.m.pipedream.net/products") else { print("No supporting URL String"); return }
        
        let request = URLRequest(url: resourceURL, cachePolicy: .useProtocolCachePolicy, timeoutInterval: 10)
        
        
//        let semaphore = DispatchSemaphore(value: 0)
        
        let sessionTask = URLSession.shared.dataTask(with: request) { [self] data, response, error in
//            guard let payload = data, error != nil else { print(error?.localizedDescription ?? "There is an error in url session")
//                return
//            }
            
            do {
                let decoder = JSONDecoder()
                let model = try decoder.decode([Product].self, from: data!)
                print(model)
                for item in model {
                    
                    favourites.append(Favourite(thumbnail: UIImage(systemName: "music.quarternote.3")! , title: item.title, album: item.price, artist: item.id))
                }
                
                    DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                }
                    print("Its done.........")
            } catch {
                print("Erro while decoding the payload")
            }
        }
        sessionTask.resume()
        //        semaphore.wait()
    }
    
}

/// To pass data to the Table Cell View
extension FavouritesVC: UITableViewDelegate, UITableViewDataSource {
    /// Returning the number of rows should appear
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favourites.count
    }
    
    /// Returning the cell that should appear
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /// Getting the one cell object from the array
        /// indexpath.row = index of the array
        let favourite = favourites[indexPath.row]
        
        /// Configuring the table cell view class with identifier
        /// as! FavouriteCell  => Put the cocoa touch class to here
        /// identifier = the identifier we gives to the table cell view in the storyboard
        /// Make sure to add the correct identifier to Table cell view in attribute inspecter
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavouriteCell") as? FavouriteCell
        
        /// Assigning data to the cell using the function implemented in the cell class
        cell?.setFavourite(favourite: favourite)
        
        return cell!
    }
}
