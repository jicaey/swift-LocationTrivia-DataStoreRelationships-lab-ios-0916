//
//  TriviaTableViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Michael Young on 10/24/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class TriviaTableViewController: UITableViewController {
    
    var store = LocationDataStore.sharedInstance
    var locationIndex: Int!
    
    //Give the view controller a Location property called location, which should be set with the relevant Location object in LocationsTableViewController's prepareForSegue method.
    var location = Location()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.accessibilityLabel = "Trivia Table"
        self.tableView.accessibilityIdentifier = "Trivia Table"
        
        NotificationCenter.default.addObserver(self, selector: #selector(shouldReload), name: NSNotification.Name(rawValue: "newTrivia"), object: nil)
    }
    
    func shouldReload() {
        self.tableView.reloadData()
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return location.trivia.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "triviaCell", for: indexPath)

        cell.textLabel?.text = location.trivia[indexPath.row].content
        cell.detailTextLabel?.text = String(location.trivia[indexPath.row].likes)

        return cell
    }
    

   
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        let destVC = segue.destination as! AddTriviaViewController
        // Pass the selected object to the new view controller
        destVC.locationIndex = locationIndex
        
    }
    

}
