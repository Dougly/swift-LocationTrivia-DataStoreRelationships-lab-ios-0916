//
//  AddTriviaViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Douglas Galante on 10/25/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

protocol AddTrivia {
    func addTrivia(trivium: Trivium)
}

class AddTriviaViewController: UIViewController {
    
    var addTriviaDelegate: AddTrivia?
    
    @IBOutlet weak var triviaTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        addTriviaDelegate?.addTrivia(trivium: Trivium(content: triviaTextField.text!, likes: 0))
        self.dismiss(animated: true, completion: nil)
        //?.popViewController(animated: true)
    }
    
    @IBAction func cancelButtonClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
}
