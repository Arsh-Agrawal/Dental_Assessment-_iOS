//
//  CaseSheetViewController.swift
//  DentalAssessment
//
//  Created by student on 24/10/19.
//  Copyright © 2019 student. All rights reserved.
//

import Foundation
import UIKit
import Eureka

class CaseSheetViewController: FormViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        form +++ Section("Personal Details")
            <<< TextRow() { row in
                row.title = "Name"
                row.placeholder = "John Doe"
            }
            <<< TextRow() { row in
                row.title = "Age"
                row.placeholder = "25"
            }
            <<< ActionSheetRow<String>() {
                $0.title = "Sex"
                $0.selectorTitle = "Pick sex"
                $0.options = ["Male","Female"]
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
              +++ Section("Details")
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
}
