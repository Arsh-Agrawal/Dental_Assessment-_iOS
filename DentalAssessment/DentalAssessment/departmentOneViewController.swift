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
                    self.startAssessmentView()
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
        patientAssessment.patient.id = pid
        self.navigationController?.pushViewController(patientAssessment, animated: true)
    }
}
