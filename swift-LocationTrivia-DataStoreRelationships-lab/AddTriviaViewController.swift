//
//  AddTriviaViewController.swift
//  swift-LocationTrivia-DataStoreRelationships-lab
//
//  Created by Michael Young on 10/25/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class AddTriviaViewController: UIViewController {
    
    var store = LocationDataStore.sharedInstance
    var locationIndex: Int!

    @IBOutlet weak var TriviumTextField: UITextField!
    
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var cancelButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        TriviumTextField.accessibilityLabel = "Trivium Text Field"
        TriviumTextField.accessibilityIdentifier = "Trivium Text Field"
        
        saveButton.accessibilityLabel = "Save Button"
        saveButton.accessibilityIdentifier = "Save Button"
        
        cancelButton.accessibilityLabel = "Cancel Button"
        cancelButton.accessibilityIdentifier = "Cancel Button"
        
        self.navigationItem.rightBarButtonItem?.accessibilityLabel = "Add Trivia Button"
        self.navigationItem.rightBarButtonItem?.accessibilityIdentifier = "Add Trivia Button"
        
    }

    @IBAction func saveButton(_ sender: AnyObject) {
       
        let newTrivium = Trivium(content: TriviumTextField.text!, likes: 0)
        
        store.locations[locationIndex].trivia.append(newTrivium)
        
        //store.locations.last?.trivia.append(newTrivium)
        
        self.dismiss(animated: true, completion: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newTrivia"), object: nil)
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "newLocation"), object:nil)
        
        
    }

    @IBAction func cancelButton(_ sender: AnyObject) {
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
