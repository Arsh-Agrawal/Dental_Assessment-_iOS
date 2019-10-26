//
//  CaseViewController.swift
//  DentalAssessment
//
//  Created by Arsh Agrawal on 26/10/19.
//  Copyright © 2019 student. All rights reserved.
//

import UIKit
import Foundation
import Eureka

class CaseViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        form +++ Section("Details")
            <<< TextRow() { row in
                row.title = "Hosptial Number"
                row.placeholder = "123"
            }
            <<< DateRow() {
                $0.value = Date()
                $0.title = "Date"
                
            }
            <<< TextRow() { row in
                row.title = "Illness History"
                row.placeholder = "ilness history"
            }
            <<< TextRow() { row in
                row.title = "Medical History"
                row.placeholder = "medical history"
            }
            <<< TextRow() { row in
                row.title = "Family History"
                row.placeholder = "Family history"
            }
            <<< TextRow() { row in
                row.title = "Personal History"
                row.placeholder = "personal history"
            }
            <<< TextRow() { row in
                row.title = "Illness History"
                row.placeholder = "history"
            }
        
        }
        

        // Do any additional setup after loading the view.
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
