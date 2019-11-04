//
//  DashboardViewController.swift
//  DentalAssessment
//
//  Created by Arsh Agrawal on 08/10/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit

class HospitalDashboardViewController: UITableViewController {
    var defaults = UserDefaults.standard
    let cellIdentifier = "departmentCellIdentifier"
    override func viewDidLoad() {
        let logoutButton = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutPressed(_:)))
        self.navigationItem.rightBarButtonItem = logoutButton
        self.navigationController?.navigationBar.prefersLargeTitles = true
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row > 0){
            performSegue(withIdentifier: "incomingPatientsSegue", sender: nil)
        }
    }
    
    @objc func logoutPressed(_ sender: Any?){
        self.defaults.removeObject(forKey: "userid")
        performSegue(withIdentifier: "logoutSegue", sender: nil)
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
