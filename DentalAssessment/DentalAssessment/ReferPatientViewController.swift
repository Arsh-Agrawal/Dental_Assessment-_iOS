//
//  ReferPatientViewController.swift
//  DentalAssessment
//
//  Created by Arsh Agrawal on 24/10/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit
import Firebase

class ReferPatientViewController: UIViewController {

    
    @IBOutlet weak var deptNameTextField: UITextField!
    
    @IBOutlet weak var patientIDLabel: UILabel!
    
    var ref : DatabaseReference?
    var dbHandle : DatabaseHandle?
    
    var patientID = "123" //value be received from patientAssessment view controller
    
    override func viewDidLoad() {
        
        patientIDLabel.text = patientID //automatic value set
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func referPressed(_ sender: Any) {
        
        guard let dept_name = deptNameTextField.text else {return}
        
        //set reference whenever the folder is loaded
        ref = Database.database().reference()
        
        self.ref?.child("dept_list").child("department1").childByAutoId().setValue(patientID)
        
        
        
//        print("value stored")
        
        //need to perform some kind of segue to back to the department selection with value of department number
        
//        self.performSegue(withIdentifier: "DashboardViewController", sender: nil)
        
        
        
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
