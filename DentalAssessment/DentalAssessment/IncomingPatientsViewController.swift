//
//  IncomingPatientsViewController.swift
//  DentalAssessment
//
//  Created by Arsh Agrawal on 26/10/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit
import Firebase
import CodableFirebase

class PatientTableViewCell: UITableViewCell{
    @IBOutlet var patientName: UILabel!
    @IBOutlet var phoneNumber: UILabel!
    @IBOutlet var date: UILabel!
    var pid : String = ""
}

class IncomingPatientsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var departmentId: Int = 1
    var postData = [[String]]()
    var ref: DatabaseReference?
    var dbHandle: DatabaseHandle?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        ref = Database.database().reference()
        
        dbHandle = ref?.child("dept_list").child("department\(self.departmentId)").observe(.childAdded, with: { (snapshot) in
            
            if !snapshot.exists(){return}

            
                if let Dictionary = snapshot.value as? [String:AnyObject] ,Dictionary.count > 0{
                    
//                    print("working")
                    guard let name = Dictionary["Name"] as? String else {return}
                    guard let phone = Dictionary["Phone"] as? String else {return}
                    guard let date = Dictionary["date"] as? String else {return}
                    let pid = snapshot.key
//                    print(pid)
                    let data = [name,phone,date,pid]
                    print(data)
                    
                    self.postData.append(data)
                    self.tableView.reloadData()
                    
                }
        })

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
//        let deleteAction  = UITableViewRowAction(style: .default, title: "Delete") { (action: UITableViewRowAction, indexPath: IndexPath) in
//
//            let deleteMenu = UIAlertController(title: nil, message: "Are you sure?", preferredStyle: .actionSheet)
//
//            let appDeleteAction = UIAlertAction(title: "Delete", style: .default, handler: nil)
//            deleteMenu.addAction(appDeleteAction)
//        }
        
        let deleteAction = UITableViewRowAction(style: .default, title: "delete" , handler: { (action:UITableViewRowAction, indexPath:IndexPath) -> Void in
            // 4
            let deleteMenu = UIAlertController(title: nil, message: "Are you sure?", preferredStyle: .actionSheet)
            
            let appDeleteAction = UIAlertAction(title: "Rate", style: .default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            
            deleteMenu.addAction(appDeleteAction)
            deleteMenu.addAction(cancelAction)
            
            self.present(deleteMenu, animated: true, completion: nil)
        })
        
        return [deleteAction]
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
        guard let patientCell = cell as? PatientTableViewCell else {return PatientTableViewCell()}
        patientCell.patientName?.text = postData[indexPath.row][0]
        patientCell.phoneNumber?.text = postData[indexPath.row][1]
        patientCell.date?.text = postData[indexPath.row][2]
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row >= 0){
            let pavc = UIStoryboard.init(name: "PatientAssessment", bundle: Bundle.main).instantiateInitialViewController() as? CaseSheetViewController
            pavc?.allowEdits = false
            
            
            guard let patientAssessment = pavc else {return}
            
            ref = Database.database().reference()
            
            print("before ref")
            
            
            //Paient
            ref?.child("Patients").observe(.childAdded, with: { (snapshot) in
                
                if !snapshot.exists() {return}
                
                if snapshot.key != self.postData[indexPath.row][3]{return}
                
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

                    
                    patientAssessment.patient.name = name
                    patientAssessment.patient.phone = phone
                    patientAssessment.patient.sex = sex
                    patientAssessment.patient.age = age
                    patientAssessment.patient.address = addr
                    patientAssessment.patient.id = snapshot.key
                    
                    self.ref?.child(self.postData[indexPath.row][3]).observe(.childAdded, with: { (snapshot) in
                        guard let value = snapshot.value else { return }
                        do {
                            let model = try FirebaseDecoder().decode(CaseSheet.self, from: value)
                            patientAssessment.caseSheet = model
                            print("patient assessment")
                            print(patientAssessment.caseSheet)
                            
                            self.navigationController?.pushViewController(patientAssessment, animated: true)
                            
                            
                        } catch let error {
                            print("in error")
                            print(error)
                        }
                        
                    })
                }
                
                
            })
            
            
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

