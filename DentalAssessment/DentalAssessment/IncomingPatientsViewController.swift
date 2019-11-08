//
//  IncomingPatientsViewController.swift
//  DentalAssessment
//
//  Created by Arsh Agrawal on 26/10/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit
import Firebase

class PatientTableViewCell: UITableViewCell{
    @IBOutlet var patientName: UILabel!
    @IBOutlet var phoneNumber: UILabel!
    @IBOutlet var date: UILabel!
}

class IncomingPatientsViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var departmentId: Int = 1
    var postData = [String]()
    var ref: DatabaseReference?
    var dbHandle: DatabaseHandle?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        ref = Database.database().reference()
        
        dbHandle = ref?.child("dept_list").child("department\(self.departmentId)").observe(.childAdded, with: { (snapshot) in
            
            let post = snapshot.value as? String
            
            if let val = post{
                self.postData.append(val)
                self.tableView.reloadData()
            }
        })

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
        guard let patientCell = cell as? PatientTableViewCell else {return PatientTableViewCell()}
        patientCell.patientName?.text = postData[indexPath.row]
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row >= 0){
            let pavc = UIStoryboard.init(name: "PatientAssessment", bundle: Bundle.main).instantiateInitialViewController() as? CaseSheetViewController
            pavc?.allowEdits = false
            self.navigationController?.pushViewController(pavc!, animated: true)
            //performSegue(withIdentifier: "caseSheetSegue", sender: nil)
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

