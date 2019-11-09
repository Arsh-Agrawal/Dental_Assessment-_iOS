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
        
        let patient = Patient()
        
        do
        {
            let data = try FirebaseEncoder().encode(patient)
            reference?.setValue(data)
            pid = (reference?.key)!
            
            //call new view controller
            print("in new patient")
            print(reference!)
            print(pid)
            
            startAssessmentView()
        }
        catch
        {
            print("error")
        }
        
        
    }
    
    func startAssessmentView(){
        let pavc = UIStoryboard.init(name: "PatientAssessment", bundle: Bundle.main).instantiateInitialViewController() as? CaseSheetViewController
        guard let patientAssessment = pavc else {return}
        patientAssessment.patient.id = pid
//        print(pid)
        self.navigationController?.pushViewController(patientAssessment, animated: true)
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
