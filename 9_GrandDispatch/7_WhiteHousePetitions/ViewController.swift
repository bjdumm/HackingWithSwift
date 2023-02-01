//
//  ViewController.swift
//  7_WhiteHousePetitions
//
//  Created by Brennan Dumm on 1/31/23.
//

import UIKit

class ViewController: UITableViewController {
    var petitions = [Petition]()

    override func viewDidLoad() {
        super.viewDidLoad()
        perform(#selector(fetchJSON), with: nil)
        //Get Data from WHPetition server and store it
//        let urlString: String
//        if navigationController?.tabBarItem.tag == 0 {
//            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
//        } else {
//            urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=10000&limit=100"
//        }
//
//
//        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
//            if let url = URL(string: urlString) {
//                if let data = try? Data(contentsOf: url) {
//                    self?.parse(json: data)
//                    return
//                }
//            }
//            self?.showError()
//        }
        
    }
    
    @objc func fetchJSON() {
        let urlString: String
        if navigationController?.tabBarItem.tag == 0 {
            urlString = "https://www.hackingwithswift.com/samples/petitions-1.json"
        } else {
            urlString = "https://api.whitehouse.gov/v1/petitions.json?signatureCountFloor=10000&limit=100"
        }
        
        
     //   DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            if let url = URL(string: urlString) {
                if let data = try? Data(contentsOf: url) {
                    parse(json: data)
                    return
                }
         //   }
            performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
        }
    }
    
   @objc func showError() {
      //  DispatchQueue.main.async { [weak self] in
            let ac = UIAlertController(title: "Loading Error", message: "There was a problem loading the feed, please try again.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
     //   }
        
    }
    
    
    func parse(json: Data) {
        let decoder = JSONDecoder()
        if let jsonPetitions = try? decoder.decode(Petitions.self, from: json) {
            petitions = jsonPetitions.results
            tableView.performSelector(onMainThread: #selector(UITableView.reloadData), with: nil, waitUntilDone: false)
            /*
            DispatchQueue.main.async { [weak self] in
                self?.tableView.reloadData()
            }*/
            
        } else {
            performSelector(onMainThread: #selector(showError), with: nil, waitUntilDone: false)
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petitions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let petition = petitions[indexPath.row]
        cell.textLabel?.text = petition.title
        cell.detailTextLabel?.text = petition.body
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.detailItem = petitions[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }


}

