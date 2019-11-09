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
    var patient = Patient()
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    // MARK: - Navigation
    @IBAction func existingPatientButton(_ sender: Any) {
        //check for name and text and send pid to patient assessment
        
        let name = nameTextField.text
        let phone = phoneTextField.text
        ref = Database.database().reference()
        
        ref?.child("Patients").queryOrdered(byChild: "name").queryEqual(toValue: name).observeSingleEvent(of: .childAdded, with: { (snapshot) in
            if !snapshot.exists(){return}
            
            if let dict = snapshot.value as? [String:Any]
            {
                guard let phone_val = dict["phone"] as? String else {return}
                if (phone_val == phone){
                    self.pid = (snapshot.ref.key!)
                    print("pid from firebase: \(self.pid)")
                    
                    self.ref?.child("Patients").observe(.childAdded, with: { (snapshot) in
                        
                        if !snapshot.exists() {return}
                        
                        if snapshot.key != self.pid{return}
                        
                        if let Dictionary = snapshot.value as? [String:AnyObject] ,Dictionary.count > 0{

                            print("inside if let")

                            guard let name = Dictionary["name"] as? String else {return}
                            print(name)
                            guard let phone = Dictionary["phone"] as? String else {return}
                            print(phone)
                            guard let age = Dictionary["age"] as? Int else {return}
                            print(age)
                            guard let sex = Dictionary["sex"] as? Int else {return}
                            guard let addr = Dictionary["address"] as? String else {return}

                            
                            self.patient.name = name
                            self.patient.phone = phone
                            self.patient.sex = sex
                            self.patient.age = age
                            self.patient.address = addr
                            self.patient.id = snapshot.key
                            self.startAssessmentView()

                        }
                    })
                    
                }
            }
            else {
                print("Cannot typecast")
                print(snapshot)
            }
        })
    }
    @IBAction func newPatientButton(_ sender: Any) {
        //create new pid and send pid to patient assessment
        ref = Database.database().reference()
        let reference = ref?.child("Patients").childByAutoId()
        guard let refKey = reference?.key else {return}
        pid = refKey
        startAssessmentView()
    }
    
    func startAssessmentView(){
        let pavc = UIStoryboard.init(name: "PatientAssessment", bundle: Bundle.main).instantiateInitialViewController() as? CaseSheetViewController
        guard let patientAssessment = pavc else {return}
        patientAssessment.patient = self.patient
        print(self.patient)
        self.navigationController?.pushViewController(patientAssessment, animated: true)
    }
}
