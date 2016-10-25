//
//  TriviaTableViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Douglas Galante on 10/24/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class TriviaTableViewController: UITableViewController, AddTrivia {
    
    
    var location = Location()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.accessibilityIdentifier = "Trivia Table"
        tableView.accessibilityLabel = "Trivia Table"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return location.trivia.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "triviaCell")
        
        cell?.textLabel?.text = location.trivia[indexPath.row].content
        cell?.detailTextLabel?.text = String(location.trivia[indexPath.row].likes)
        
        return cell!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addTrivia" {
            let dest = segue.destination as! AddTriviaViewController
            dest.addTriviaDelegate = self
        }
    }
    
    func addTrivia(trivium: Trivium) {
        location.trivia.append(trivium)
        self.tableView.reloadData()
    }
    
    
    
}
