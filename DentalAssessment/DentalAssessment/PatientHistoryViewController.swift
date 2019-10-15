//
//  PatientHistoryViewController.swift
//  DentalAssessment
//
//  Created by Arsh Agrawal on 15/10/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit
import Firebase

class PatientHistoryViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    var postData = [String]()
    
    var ref: DatabaseReference?
    var dbHandle: DatabaseHandle?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        
        //set reference whenever the folder is loaded
        ref = Database.database().reference()
        
        dbHandle = ref?.child("history").observe(.childAdded, with: { (snapshot) in
            
            //convert the snapshot val to string
            let post = snapshot.value as? String
            
            if let val = post {
                
                //append the value to postData
                
                self.postData.append(val)
                
                //reload the table
                self.tableView.reloadData()
                
                
            }
        })
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return postData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")
        cell?.textLabel?.text = postData[indexPath.row]
        
        return cell!
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
