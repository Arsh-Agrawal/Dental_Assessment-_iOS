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
    var caseSheet = CaseSheet()
    override func viewDidLoad() {
        super.viewDidLoad()
        //let editButton = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector())
        //self.navigationItem.rightBarButtonItem = editButton
        form +++ Section("Personal Details")
            <<< TextRow() { row in
                row.title = "Name"
                row.placeholder = "John Doe"
                }.onChange({ textrow in
                    guard let name = textrow.value else {return}
                    self.caseSheet.patient.name = name
                })
            <<< TextRow() { row in
                row.title = "Age"
                row.placeholder = "25"
                }.onChange({ textrow in
                    guard let age = Int(textrow.value ?? "") else {return}
                    self.caseSheet.patient.age = age
                })
            <<< SegmentedRow<String>() { row in
                row.title = "Sex"
                row.options = ["Male","Female"]
                }.cellSetup { cell, _ in
                    guard let titleLabel = cell.titleLabel else {return}
                    cell.segmentedControl.widthAnchor.constraint(equalTo: titleLabel.widthAnchor).isActive = true
                }.onChange({ segmentedRow in
                    guard let sex = segmentedRow.value else {return}
                    switch(sex){
                    case "Male":
                        self.caseSheet.patient.sex = 1
                    default:
                        self.caseSheet.patient.sex = 0
                    }
                })
            <<< PhoneRow() { row in
                row.title = "Phone"
                row.placeholder = "+91 1234567890"
                }.onChange({ textrow in
                    guard let phone = textrow.value else {return}
                    self.caseSheet.patient.phone = phone
                })
            <<< LabelRow {row in
                row.title = "Address"
                }
            <<< TextAreaRow { row in
                row.title = "Address"
                row.placeholder = "Street Address\nLocality\nCity, State\nPincode"
                }.onChange({ textrow in
                    guard let addr = textrow.value else {return}
                    self.caseSheet.patient.address = addr
                })
            
            
            +++ Section("Assessment")
            <<< TextRow() { row in
                row.title = "Hosptial Number"
                row.placeholder = "123"
                }.onChange({ textrow in
                    guard let num = Int(textrow.value ?? "") else {return}
                    self.caseSheet.hospitalNum = num
                })
            <<< DateRow() { row in
                row.value = Date()
                row.title = "Date"
                }.onChange({ dateRow in
                    guard let date = dateRow.value else {return}
                    self.caseSheet.date = date
                })
            <<< LabelRow() { row in
                row.title = "Present Illness History"
            }
            <<< TextAreaRow { row in
                row.placeholder = "Enter history of present illness"
                }.onChange({ textrow in
                    guard let history = textrow.value else {return}
                    self.caseSheet.illnessHistory = history
                })
            <<< LabelRow() { row in
                row.title = "Medical History"
            }
            <<< TextAreaRow { row in
                row.placeholder = "Enter relevant medical history"
                }.onChange({ textrow in
                    guard let history = textrow.value else {return}
                    self.caseSheet.medicalHistory = history
                })
            <<< LabelRow() { row in
                row.title = "Family History"
            }
            <<< TextAreaRow { row in
                row.placeholder = "Enter family history"
                }.onChange({ textrow in
                    guard let history = textrow.value else {return}
                    self.caseSheet.familyHistory = history
                })
            <<< LabelRow() { row in
                row.title = "Past dental History"
            }
            <<< TextAreaRow { row in
                row.placeholder = "Enter dental history"
                }.onChange({ textrow in
                    guard let history = textrow.value else {return}
                    self.caseSheet.dentalHistory = history
                })
            
            
            +++ Section("General Examination")
            <<< TextRow() { row in
                row.title = "Build and gait"
                row.placeholder = "description"
                }.onChange({ textrow in
                    guard let gait = textrow.value else {return}
                    self.caseSheet.generalExamination.gait = gait
                })
            <<< TextRow() { row in
                row.title = "Vital signs"
                row.placeholder = "description"
                }.onChange({ textrow in
                    guard let vitals = textrow.value else {return}
                    self.caseSheet.generalExamination.vitals = vitals
                })
            <<< TextRow() { row in
                row.title = "Other findings"
                row.placeholder = "description"
                }.onChange({ textrow in
                    guard let findings = textrow.value else {return}
                    self.caseSheet.generalExamination.findings = findings
                })
        
        
            +++ Section("Extraoral Examination")
            <<< TextRow() { row in
                row.title = "Eyes, ears and nose"
                row.placeholder = "description"
                }.onChange({ textrow in
                    guard let ent = textrow.value else {return}
                    self.caseSheet.extraoralExamination.ent = ent
                })
            <<< TextRow() { row in
                row.title = "Facial symmetry"
                row.placeholder = "description"
                }.onChange({ textrow in
                    guard let symmetry = textrow.value else {return}
                    self.caseSheet.extraoralExamination.facialSymmetry = symmetry
                })
            <<< TextRow() { row in
                row.title = "Facial profile"
                row.placeholder = "description"
                }.onChange({ textrow in
                    guard let profile = textrow.value else {return}
                    self.caseSheet.extraoralExamination.facialProfile = profile
                })
            <<< TextRow() { row in
                row.title = "Lips"
                row.placeholder = "description"
                }.onChange({ textrow in
                    guard let lips = textrow.value else {return}
                    self.caseSheet.extraoralExamination.lips = lips
                })
            <<< TextRow() { row in
                row.title = "TMJ Examination"
                row.placeholder = "description"
                }.onChange({ textrow in
                    guard let tmj = textrow.value else {return}
                    self.caseSheet.extraoralExamination.tmj = tmj
                })
            <<< TextRow() { row in
                row.title = "Lymph nodes"
                row.placeholder = "description"
                }.onChange({ textrow in
                    guard let lymph = textrow.value else {return}
                    self.caseSheet.extraoralExamination.lymph = lymph
                })
            <<< TextRow() { row in
                row.title = "Mouth opening"
                row.placeholder = "description"
                }.onChange({ textrow in
                    guard let mouth = textrow.value else {return}
                    self.caseSheet.extraoralExamination.mouth = mouth
                })
        
            
            +++ Section("Intraoral examination")
            +++ Section("Soft tissue examination")
            <<< TextRow() { row in
                row.title = "Labial Mucosa"
                row.placeholder = "description"
                }.onChange({ textrow in
                    guard let labial = textrow.value else {return}
                    self.caseSheet.intraoralExamination.softTissue.labialMucosa = labial
                })
            <<< TextRow() { row in
                row.title = "Buccal Mucosa"
                row.placeholder = "description"
                }.onChange({ textrow in
                    guard let buccal = textrow.value else {return}
                    self.caseSheet.intraoralExamination.softTissue.buccalMucosa = buccal
                })
            <<< TextRow() { row in
                row.title = "Palate"
                row.placeholder = "description"
                }.onChange({ textrow in
                    guard let palate = textrow.value else {return}
                    self.caseSheet.intraoralExamination.softTissue.palate = palate
                })
            <<< TextRow() { row in
                row.title = "Floor of mouth"
                row.placeholder = "description"
                }.onChange({ textrow in
                    guard let floor = textrow.value else {return}
                    self.caseSheet.intraoralExamination.softTissue.floorOfMouth = floor
                })
            <<< TextRow() { row in
                row.title = "Toungue"
                row.placeholder = "description"
                }.onChange({ textrow in
                    guard let tongue = textrow.value else {return}
                    self.caseSheet.intraoralExamination.softTissue.tongue = tongue
                })
            <<< TextRow() { row in
                row.title = "Vestibules"
                row.placeholder = "description"
                }.onChange({ textrow in
                    guard let vestibules = textrow.value else {return}
                    self.caseSheet.intraoralExamination.softTissue.vestibules = vestibules
                })
            <<< TextRow() { row in
                row.title = "Faucial Pillars"
                row.placeholder = "description"
                }.onChange({ textrow in
                    guard let pillars = textrow.value else {return}
                    self.caseSheet.intraoralExamination.softTissue.faucialPillers = pillars
                })
            +++ Section("Gingiva")
            <<< TextRow() { row in
                row.title = "Color"
                row.placeholder = "description"
                }.onChange({ textrow in
                    guard let color = textrow.value else {return}
                    self.caseSheet.intraoralExamination.softTissue.gingiva.color = color
                })
            <<< TextRow() { row in
                row.title = "Contour"
                row.placeholder = "description"
                }.onChange({ textrow in
                    guard let contour = textrow.value else {return}
                    self.caseSheet.intraoralExamination.softTissue.gingiva.contour = contour
                })
            <<< TextRow() { row in
                row.title = "Position"
                row.placeholder = "description"
                }.onChange({ textrow in
                    guard let pos = textrow.value else {return}
                    self.caseSheet.intraoralExamination.softTissue.gingiva.position = pos
                })
            <<< TextRow() { row in
                row.title = "Surface Texture"
                row.placeholder = "description"
                }.onChange({ textrow in
                    guard let texture = textrow.value else {return}
                    self.caseSheet.intraoralExamination.softTissue.gingiva.surfaceTexture = texture
                })
            <<< TextRow() { row in
                row.title = "Consistency"
                row.placeholder = "description"
                }.onChange({ textrow in
                    guard let consistency = textrow.value else {return}
                    self.caseSheet.intraoralExamination.softTissue.gingiva.consistency = consistency
                })
            <<< TextRow() { row in
                row.title = "Periodontal Pockets"
                row.placeholder = "description"
                }.onChange({ textrow in
                    guard let pockets = textrow.value else {return}
                    self.caseSheet.intraoralExamination.softTissue.gingiva.periodontalPockets = pockets
                })
            +++ Section("")
            <<< TextRow() { row in
                row.title = "Oral hygiene status"
                row.placeholder = "hygiene status"
                }.onChange({ textrow in
                    guard let hygiene = textrow.value else {return}
                    self.caseSheet.intraoralExamination.hygieneStatus = hygiene
                })
            <<< SegmentedRow<String>() { row in
                row.title = "Halitosis"
                row.options = ["Yes","No"]
                }.cellSetup { cell, _ in
                    guard let titleLabel = cell.titleLabel else {return}
                    cell.segmentedControl.widthAnchor.constraint(equalTo: titleLabel.widthAnchor).isActive = true
                }.onChange({ segmentedRow in
                    guard let halitosis = segmentedRow.value else {return}
                    switch(halitosis){
                    case "yes":
                        self.caseSheet.intraoralExamination.halitosis = true
                    default:
                        self.caseSheet.intraoralExamination.halitosis = false
                    }
                })
            <<< SegmentedRow<String>() { row in
                row.title = "Stains"
                row.options = ["Yes","No"]
                }.cellSetup { cell, _ in
                    guard let titleLabel = cell.titleLabel else {return}
                    cell.segmentedControl.widthAnchor.constraint(equalTo: titleLabel.widthAnchor).isActive = true
                }.onChange({ segmentedRow in
                    guard let stains = segmentedRow.value else {return}
                    switch(stains){
                    case "yes":
                        self.caseSheet.intraoralExamination.stains = true
                    default:
                        self.caseSheet.intraoralExamination.stains = false
                    }
                })
            <<< SegmentedRow<String>() { row in
                row.title = "Calculus"
                row.options = ["Yes","No"]
                }.cellSetup { cell, _ in
                    guard let titleLabel = cell.titleLabel else {return}
                    cell.segmentedControl.widthAnchor.constraint(equalTo: titleLabel.widthAnchor).isActive = true
                }.onChange({ segmentedRow in
                    guard let calculus = segmentedRow.value else {return}
                    switch(calculus){
                    case "yes":
                        self.caseSheet.intraoralExamination.calculus = true
                    default:
                        self.caseSheet.intraoralExamination.calculus = false
                    }
                })
        let teethViewRow = TeethViewRow() { row in
            row.cell.cellPressed = { button in
                if let idx = self.teethStatuses.firstIndex(of: self.teethStatus) {
                    button.setTitle(self.teethStatusesShort[idx], for: .normal)
                }
                else {
                    button.setTitle("-", for: .normal)
                }
            }
        }
        
        form +++ Section("Hard tissue examination")
            <<< PushRow<String>(){ row in
                row.title = "Mark cells as"
                row.options = self.teethStatuses
            }.onChange({ pushrow in
                guard let selection = pushrow.value else {
                    self.teethStatus = ""
                    return
                }
                self.teethStatus = selection
            })
            <<< teethViewRow
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
        let treatmentsSection = MultivaluedSection(multivaluedOptions: [.Reorder, .Insert, .Delete],
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
        let drugsSection = MultivaluedSection(multivaluedOptions: [.Reorder, .Insert, .Delete],
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
        let deptVisitPriority = MultivaluedSection(multivaluedOptions: [.Reorder, .Insert, .Delete],
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
        form +++ treatmentsSection
            +++ drugsSection
            +++ deptVisitPriority
            +++ Section("Examined by")
            <<< TextRow() { row in
                row.title = "Student"
                row.placeholder = "Student name"
            }
            <<< TextRow() { row in
                row.title = "Staff"
                row.placeholder = "Staff name"
            }
            <<< ButtonRow() { row in
                    row.title = "Submit"
                }.onCellSelection({ buttonCell, buttonRow in
                    self.caseSheet.treatmentPlan = treatmentsSection.values() as? [String] ?? []
                    self.caseSheet.prescriptions = drugsSection.values() as? [String] ?? []
                    self.caseSheet.visitPriority = deptVisitPriority.values() as? [String] ?? []
                    self.caseSheet.intraoralExamination.hardTissue = []
                    guard let statusButtons = teethViewRow.cell.statusButtons else {return}
                    for statusButton in statusButtons {
                        if let titleLabel = statusButton.titleLabel { self.caseSheet.intraoralExamination.hardTissue.append(titleLabel.text ?? "-")
                        }
                    }
                    do{
                        let data = try JSONEncoder().encode(self.caseSheet)
                        print(String(data: data, encoding: .utf8)!)
                        self.navigationController?.popViewController(animated: true)
                    }
                    catch {
                        print("error")
                    }
                })
    }
}
