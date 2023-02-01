//
//  ViewController.swift
//  7_WhiteHousePetitions
//
//  Created by Brennan Dumm on 1/31/23.
//

import UIKit

class ViewController: UITableViewController {
    var petiions: [String]

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return petiions.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "Title goes here"
        cell.detailTextLabel?.text = "Subtitle goes here"
        return cell
    }


}

