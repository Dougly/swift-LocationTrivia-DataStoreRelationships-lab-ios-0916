//
//  AddLocationViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Douglas Galante on 10/25/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

protocol AddLocation {
    func addLocationToArray (location: Location)
}

class AddLocationViewController: UIViewController, UITextFieldDelegate {
    
    var addLocationDelegate: AddLocation?
    
    var name = String()
    var longitude = Float()
    var latitude = Float()
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var longitudeField: UITextField!
    @IBOutlet weak var latitudeField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    @IBAction func saveButtonClicked(_ sender: UIButton) {
        let newLocation = Location(name: name, latitude: latitude, longitude: longitude)
        dump(newLocation)

        addLocationDelegate?.addLocationToArray(location: Location(name: name, latitude: latitude, longitude: longitude))
        self.dismiss(animated: true, completion: nil)
    
    }
    
    @IBAction func cancelButtonClikced(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameField.delegate = self
        longitudeField.delegate = self
        latitudeField.delegate = self
        
        saveButton.accessibilityLabel = "saveButton"
        saveButton.accessibilityIdentifier = "saveButton"
        cancelButton.accessibilityIdentifier = "cancelButton"
        cancelButton.accessibilityLabel = "cancelButton"
    
    }
    
    
    
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        switch textField {
        case nameField:
            name = nameField.text!
        case longitudeField:
            if let input = Float(longitudeField.text!) {
                longitude = input
            }
        case latitudeField:
            if let input = Float(latitudeField.text!) {
                latitude = input
            }
        default:
            print("got to default")
            break
        }
    }
}


