//
//  departmentOneViewController.swift
//  DentalAssessment
//
//  Created by Arsh Agrawal on 08/11/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit
import Firebase
import CodableFirebase

class departmentOneViewController: UIViewController {
    
    var ref: DatabaseReference?
    var dbHandle: DatabaseHandle?
    var pid : String = ""
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var phoneTextField: UITextField!
    
    @IBAction func existingPatientButton(_ sender: Any) {
        
        //check for name and text and send pid to patient assessment
        
        var name = nameTextField.text
        var phone = phoneTextField.text
        ref = Database.database().reference()
        
        
        
        ref?.child("Patients").queryOrdered(byChild: "name").queryEqual(toValue: name).observe(.childAdded, with: { (snapshot) in
            
            if !snapshot.exists(){return}
            
//            if let phone_val = snapshot.value
//            {
//                if (String(phone_val) == phone){
//                    self.pid = (snapshot.ref.parent?.key!)!
//                }
//            }
            
            
            
            
        })
        
    }
    @IBAction func newPatientButton(_ sender: Any) {
        
        //create new pid and send pid to patient assessment
        ref = Database.database().reference()
        let reference = ref?.child("Patients").childByAutoId()
        
        let patient = Patient()
        
        do
        {
            let data = try FirebaseEncoder().encode(patient)
            reference?.setValue(data)
            pid = (reference?.key)!
            
            //call new view controller 
        }
        catch
        {
            print("error")
        }
        
        
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
