//
//  LocationsTableViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Michael Young on 10/24/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class LocationsTableViewController: UITableViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var detailTextLabel: UILabel!
    
    
    var store = LocationDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.accessibilityLabel = "Locations Table"
        self.tableView.accessibilityIdentifier = "Locations Table"
        
        self.navigationItem.rightBarButtonItem?.accessibilityLabel = "addButton"
        self.navigationItem.rightBarButtonItem?.accessibilityIdentifier = "addButton"
        
        NotificationCenter.default.addObserver(self, selector: #selector(shouldReload), name: NSNotification.Name(rawValue: "newLocation"), object: nil)
    }
    
    func shouldReload() {
        self.tableView.reloadData()
    }
   
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.locations.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "locationCell", for: indexPath)
        
        cell.textLabel?.text = store.locations[indexPath.row].name
        
        cell.detailTextLabel?.text = String(describing: store.locations[indexPath.row].trivia.count)
        return cell
    }
    
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destVC = segue.destination as! TriviaTableViewController

            // Pass the selected object to the new view controller.
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let location = store.locations[indexPath.row]
                destVC.location = location
                destVC.locationIndex = indexPath.row
            
        }
    }
    
    
    
}
