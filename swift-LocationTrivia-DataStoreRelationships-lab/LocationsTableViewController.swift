//
//  LocationsTableViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Douglas Galante on 10/24/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit


class LocationsTableViewController: UITableViewController, AddLocation {
    
    let store: LocationsDataStore = LocationsDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.accessibilityLabel = "Locations Table"
        tableView.accessibilityIdentifier = "Locations Table"
        store.generateStartingLocationsData()
        print(store.locations)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.locations.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "standardCell")
        let index = indexPath.row
        cell?.textLabel?.text = store.locations[index].name
        cell?.detailTextLabel?.text = String(store.locations[index].trivia.count)
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showTrivia" {
            let dest = segue.destination as! TriviaTableViewController
            let index = tableView.indexPathForSelectedRow?.row
            
            if let index = index {
                dest.location = store.locations[index]
            }
        }
        
        if segue.identifier == "showAddLocation" {
            let dest = segue.destination as! AddLocationViewController
            dest.addLocationDelegate = self
        }
    }
    
    func addLocationToArray (location: Location) {
        store.locations.append(location)
        dump(store.locations)
        tableView.reloadData()
    }
    
}
