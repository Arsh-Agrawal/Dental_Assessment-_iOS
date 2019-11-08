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
        let logoutButton = UIBarButtonItem(title: "Sign out", style: .plain, target: self, action: #selector(logoutPressed(_:)))
        self.navigationItem.rightBarButtonItem = logoutButton
        self.navigationController?.navigationBar.prefersLargeTitles = true
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    // MARK: - Navigation
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.row > 0){
            let incomingPatientsView = UIStoryboard.init(name: "IncomingPatients", bundle: Bundle.main).instantiateInitialViewController() as? IncomingPatientsViewController
            guard let incomingPatients = incomingPatientsView else {return}
            incomingPatients.departmentId = indexPath.row
            self.navigationController?.pushViewController(incomingPatients, animated: true)
        }
    }
    
    @objc func logoutPressed(_ sender: Any?){
        let alert = UIAlertController(title: "Sign out?", message: "You can always access the app by signing back in", preferredStyle: UIAlertController.Style.alert)

        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.default, handler: { _ in
            //Cancel Action
        }))
        alert.addAction(UIAlertAction(title: "Sign out",
                                      style: UIAlertAction.Style.default,
                                      handler: {(_: UIAlertAction!) in
                                        self.defaults.removeObject(forKey: "userid")
                                        self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    /*
    

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
