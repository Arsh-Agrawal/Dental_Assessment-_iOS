//
//  BasicDetailsViewController.swift
//  DentalAssessment
//
//  Created by Arsh Agrawal on 15/10/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit
import Firebase

class BasicDetailsViewController: UIViewController {
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var genderText: UITextField!
    
    @IBOutlet weak var maritalStatusText: UITextField!
    @IBOutlet weak var phoneText: UITextField!
    @IBOutlet weak var addressText: UITextField!
    
    @IBOutlet weak var occupationText: UITextField!
    
    var ref : DatabaseReference?
    var dbHandle: DatabaseHandle?
    
    var patientID: String = "patient1" //put the value retrieved from dashboard here
    
    override func viewDidLoad() {
        
        // Do any additional setup after loading the view.
        
        //connection reference
        ref = Database.database().reference()
        print("snapshot value")
        print("snapshot value")
        
        dbHandle = ref?.child("Patients").child(patientID).observe(.value, with: { (snapshot) in
            
            if !snapshot.exists()
            {
                print("snapshot returned")
                return;
            }
            
            print(snapshot)
            
            let value = snapshot.value as? NSDictionary
            if let check = value?["address"] as? String
            {
                self.addressText.text = check
            }
            if let check = value?["age"] as? Int
            {
                self.ageText.text = String(check)
            }
            if let check = value?["name"] as? String
            {
                self.nameText.text = check
            }
            if let check = value?["phone"] as? String
            {
                self.phoneText.text = check
            }
            if let check = value?["sex"] as? Int
            {
                self.genderText.text = String(check)
            }
            if let check = value?["occupation"] as? String
            {
                self.occupationText.text = check
            }
            if let check = value?["marital_status"] as? String
            {
                self.maritalStatusText.text = check
            }
            
            
        })
        super.viewDidLoad()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
