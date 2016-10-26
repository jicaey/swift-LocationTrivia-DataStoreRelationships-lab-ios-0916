//
//  AddLocationViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Michael Young on 10/25/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class AddLocationViewController: UIViewController {
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var latitudeField: UITextField!
    @IBOutlet weak var longitudeField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    let store = LocationDataStore.sharedInstance
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.nameField.accessibilityLabel = "nameField"
        self.nameField.accessibilityIdentifier = "nameField"
        self.latitudeField.accessibilityLabel = "latitudeField"
        self.latitudeField.accessibilityIdentifier = "latitudeField"
        self.longitudeField.accessibilityLabel = "longitudeField"
        self.longitudeField.accessibilityIdentifier = "longitudeField"
        
        self.saveButton.accessibilityLabel = "saveButton"
        self.saveButton.accessibilityIdentifier = "saveButton"
        self.cancelButton.accessibilityLabel = "cancelButton"
        self.cancelButton.accessibilityIdentifier = "cancelButton"
        
        
        
        
    }
    
    
    @IBAction func saveButton(_ sender: UIButton) {
        
        
        // This action need error handling.
        let name = nameField.text
        let latitude = Float(latitudeField.text!)
        let longitude = Float(longitudeField.text!)
        
        let newLocation = Location(name: name!, latitude: latitude!, longitude: longitude!)
        
        store.locations.append(newLocation)
        
        self.dismiss(animated: true, completion: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newLocation"), object: nil)

    }
    
    @IBAction func cancelButton(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}


