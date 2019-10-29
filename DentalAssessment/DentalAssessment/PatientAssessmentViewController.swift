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
    var teethStatus = ""
    let teethStatuses = ["Decayed (D)", "Decayed with pulpal involvement (Pl)", "Root stump (RS)", "Missing (M)", "Filled (F)", "Mobility (Mo)", "Fracture (#)", "Prosthetic crown (C)", "Removable Partial Denture (RPD)", "Fixed partial denture (FPD)", "Attrition (AT)", "Abrasion (AB)", "Erosion (ER)"]
    let teethStatusesShort = ["D", "Pl", "RS", "M", "F", "Mo", "#", "C", "RPD", "FPD", "AT", "AB", "ER"]
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
            <<< SegmentedRow<String>() { row in
                row.title = "Sex"
                row.options = ["Male","Female"]
                }.cellSetup { cell, _ in
                    guard let titleLabel = cell.titleLabel else {return}
                    cell.segmentedControl.widthAnchor.constraint(equalTo: titleLabel.widthAnchor).isActive = true
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
            <<< DateRow() { row in
                row.value = Date()
                row.title = "Date"
                
            }
            <<< LabelRow() { row in
                row.title = "Present Illness History"
            }
            <<< TextAreaRow { row in
                row.placeholder = "Enter history of present illness"
            }
            <<< LabelRow() { row in
                row.title = "Medical History"
            }
            <<< TextAreaRow { row in
                row.placeholder = "Enter relevant medical history"
            }
            <<< LabelRow() { row in
                row.title = "Family History"
            }
            <<< TextAreaRow { row in
                row.placeholder = "Enter family history"
            }
            <<< LabelRow() { row in
                row.title = "Past dental History"
            }
            <<< TextAreaRow { row in
                row.placeholder = "Enter dental history"
            }
            
            
            +++ Section("General Examination")
            <<< TextRow() { row in
                row.title = "Build and gait"
                row.placeholder = "description"
            }
            <<< TextRow() { row in
                row.title = "Vital signs"
                row.placeholder = "description"
            }
            <<< TextRow() { row in
                row.title = "Other findings"
                row.placeholder = "description"
            }
        
        
            +++ Section("Extraoral Examination")
            <<< TextRow() { row in
                row.title = "Eyes, ears and nose"
                row.placeholder = "description"
            }
            <<< TextRow() { row in
                row.title = "Facial symmetry"
                row.placeholder = "description"
            }
            <<< TextRow() { row in
                row.title = "Facial profile"
                row.placeholder = "description"
            }
            <<< TextRow() { row in
                row.title = "Lips"
                row.placeholder = "description"
            }
            <<< TextRow() { row in
                row.title = "TMJ Examination"
                row.placeholder = "description"
            }
            <<< TextRow() { row in
                row.title = "Lymph nodes"
                row.placeholder = "description"
            }
            <<< TextRow() { row in
                row.title = "Mouth opening"
                row.placeholder = "description"
            }
        
            
            +++ Section("Intraoral examination")
            +++ Section("Soft tissue examination")
            <<< TextRow() { row in
                row.title = "Labial Mucosa"
                row.placeholder = "description"
            }
            <<< TextRow() { row in
                row.title = "Buccal Mucosa"
                row.placeholder = "description"
            }
            <<< TextRow() { row in
                row.title = "Palate"
                row.placeholder = "description"
            }
            <<< TextRow() { row in
                row.title = "Floor of mouth"
                row.placeholder = "description"
            }
            <<< TextRow() { row in
                row.title = "Toungue"
                row.placeholder = "description"
            }
            <<< TextRow() { row in
                row.title = "Vestibules"
                row.placeholder = "description"
            }
            <<< TextRow() { row in
                row.title = "Faucial Pillars"
                row.placeholder = "description"
            }
            +++ Section("Gingiva")
            <<< TextRow() { row in
                row.title = "Color"
                row.placeholder = "description"
            }
            <<< TextRow() { row in
                row.title = "Contour"
                row.placeholder = "description"
            }
            <<< TextRow() { row in
                row.title = "Position"
                row.placeholder = "description"
            }
            <<< TextRow() { row in
                row.title = "Surface Texture"
                row.placeholder = "description"
            }
            <<< TextRow() { row in
                row.title = "Consistency"
                row.placeholder = "description"
            }
            <<< TextRow() { row in
                row.title = "Periodontal Pockets"
                row.placeholder = "description"
            }
            +++ Section("")
            <<< TextRow() { row in
                row.title = "Oral hygiene status"
                row.placeholder = "hygiene status"
            }
            <<< SegmentedRow<String>() { row in
                row.title = "Halitosis"
                row.options = ["Yes","No"]
                }.cellSetup { cell, _ in
                    guard let titleLabel = cell.titleLabel else {return}
                    cell.segmentedControl.widthAnchor.constraint(equalTo: titleLabel.widthAnchor).isActive = true
            }
            <<< SegmentedRow<String>() { row in
                row.title = "Stains"
                row.options = ["Yes","No"]
                }.cellSetup { cell, _ in
                    guard let titleLabel = cell.titleLabel else {return}
                    cell.segmentedControl.widthAnchor.constraint(equalTo: titleLabel.widthAnchor).isActive = true
            }
            <<< SegmentedRow<String>() { row in
                row.title = "Calculus"
                row.options = ["Yes","No"]
                }.cellSetup { cell, _ in
                    guard let titleLabel = cell.titleLabel else {return}
                    cell.segmentedControl.widthAnchor.constraint(equalTo: titleLabel.widthAnchor).isActive = true
            }
        
            +++ Section("Hard tissue examination")
            <<< PushRow<String>(){ row in
                row.title = "Mark cells as"
                row.options = self.teethStatuses
            }.onChange({ pushrow in
                guard let selection = pushrow.value else {return}
                self.teethStatus = selection
            })
            <<< TeethViewRow() { row in
                row.cell.cellPressed = { button in
                    if let idx = self.teethStatuses.firstIndex(of: self.teethStatus) {
                        button.setTitle(self.teethStatusesShort[idx], for: .normal)
                    }
                }
            }
            +++ Section("Description of specific findings")
            <<< TextAreaRow() { row in
                row.placeholder = "Description"
            }
            +++ Section("Clinical Diagnosis")
            <<< TextAreaRow() { row in
                row.placeholder = "Description"
            }
            +++ Section("Differential Diagnosis")
            <<< TextAreaRow() { row in
                row.placeholder = "Description"
            }
            +++ Section("Investigation and results")
            <<< TextAreaRow() { row in
                row.placeholder = "Description"
            }
            +++ Section("Final diagnosis")
            <<< TextAreaRow() { row in
                row.placeholder = "Description"
            }
            +++ MultivaluedSection(multivaluedOptions: [.Reorder, .Insert, .Delete],
                                   header: "Treatment Plan", footer: "List out steps in treatment plan"){ section in
                                    section.addButtonProvider = { sec in
                                        return ButtonRow(){ row in
                                            row.title = "Add treatment step"
                                        }
                                    }
                                    section.multivaluedRowToInsertAt = { index in
                                        return TextRow() { row in
                                            row.placeholder = "Treatment step"
                                        }
                                    }
                                    section <<< TextRow { row in
                                        row.placeholder = "Treatment step"
                                    }
            }
            +++ MultivaluedSection(multivaluedOptions: [.Reorder, .Insert, .Delete],
                                   header: "Drugs prescribed", footer: "List prescribed drugs"){ section in
                                    section.addButtonProvider = { sec in
                                        return ButtonRow(){ row in
                                            row.title = "Add drug step"
                                        }
                                    }
                                    section.multivaluedRowToInsertAt = { index in
                                        return TextRow() { row in
                                            row.placeholder = "Drug name"
                                        }
                                    }
                                    section <<< TextRow { row in
                                        row.placeholder = "Drug name"
                                    }
            }
            +++ MultivaluedSection(multivaluedOptions: [.Reorder, .Insert, .Delete],
                                   header: "Priority", footer: "priority in which to visit other departments"){ section in
                                    section.addButtonProvider = { sec in
                                        return ButtonRow(){ row in
                                            row.title = "Add department"
                                        }
                                    }
                                    section.multivaluedRowToInsertAt = { index in
                                        return PushRow<String>() { row in
                                            row.options = [
                                                "2. Conservative Dentistry",
                                                "3. Periodontics",
                                                "4. Oral & Maxillofacial Surgery",
                                                "5. Prosthodontics",
                                                "6. Pedodontics",
                                                "7. Orthodontics"
                                            ]
                                        }
                                    }
            }
            +++ Section("Examined by")
            <<< TextRow() { row in
                row.title = "Student"
                row.placeholder = "Student name"
            }
            <<< TextRow() { row in
                row.title = "Staff"
                row.placeholder = "Staff name"
            }
    }
}
