//
//  ReferPatientViewController.swift
//  DentalAssessment
//
//  Created by Arsh Agrawal on 24/10/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit
import Firebase
import Eureka
import Foundation


class ReferPatientViewController: UIViewController{

    
    @IBOutlet weak var deptNameTextField: UITextField!
    
    @IBOutlet weak var patientIDLabel: UILabel!
    
    var ref : DatabaseReference?
    var dbHandle : DatabaseHandle?
    
    var patientID = "123" //value be received from patientAssessment view controller
    
    override func viewDidLoad() {
        
        patientIDLabel.text = patientID //automatic value set
        let form = forForm()
        form.form_struct()
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
    

}

class forForm: FormViewController {
    
    func form_struct() {
        
        print("in the function")
        form +++ Section("Details")
            
            <<< TextRow() { row in
                row.title = "Patient ID"
                row.placeholder = "123"
            }
            <<< ActionSheetRow<String>() {
                $0.title = "Department"
                $0.selectorTitle = "Pick Department"
                $0.options = ["Department-1","Department-2","Department-3","Department-4","Department-5","Department-6","Department-7"]
        }
        
        
        
    }
    
}
