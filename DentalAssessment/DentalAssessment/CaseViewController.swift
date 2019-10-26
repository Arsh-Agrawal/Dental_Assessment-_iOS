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
        
        form +++ Section("Personal Details")
            <<< LabelRow() { row in
                row.title = "Name"
            }
            <<< LabelRow() { row in
                row.title = "Age"
            }
            <<< LabelRow() { row in
                row.title = "Sex"
            }
            <<< PhoneRow() { row in
                row.title = "Phone"
                row.placeholder = "+91 1234567890"
            }
            <<< LabelRow {row in
                row.title = "Address"
            }
            <<< TextAreaRow { row in
                row.title = "Address"
                row.placeholder = "Street Address\nLocality\nCity, State\nPincode"
            }
            +++ Section("Assessment")
            <<< TextRow() { row in
                row.title = "Hosptial Number"
                row.placeholder = "123"
            }
            <<< DateRow() {
                $0.value = Date()
                $0.title = "Date"
                
            }
            <<< LabelRow() { row in
                row.title = "Illness History"
            }
            <<< TextAreaRow { row in
            }
            <<< LabelRow() { row in
                row.title = "Medical History"
            }
            <<< TextAreaRow { row in
            }
            <<< LabelRow() { row in
                row.title = "Family History"
            }
            <<< TextAreaRow { row in
            }
            <<< LabelRow() { row in
                row.title = "Personal History"
            }
            <<< TextAreaRow { row in
            }
            <<< LabelRow() { row in
                row.title = "Illness History"
            }
            <<< TextAreaRow { row in
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
