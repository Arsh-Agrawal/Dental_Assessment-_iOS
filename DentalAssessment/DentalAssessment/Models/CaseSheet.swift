//
//  CaseSheet.swift
//  DentalAssessment
//
//  Created by student on 08/10/19.
//  Copyright © 2019 student. All rights reserved.
//

import Foundation

struct CaseSheet{
    var id: String
    var patient: Patient
    var hospitalNum: Int
    var date: Date
    var illnessHistory: String
    var medicalHistory: String
    var familyHistory: String
    var personalHistory: PersonalHistory
    var generalExamination: GeneralExamination
    var extraoralExamination: ExtraoralExamination
    var intraoralExamination: IntraoralExamination
    var clinicalDiagnosis: String
    var differentialDiagnosis: String
    var investigationsAndResults: String
    var finalDiagnosis: String
    var treatmentPlan: String
    var prescriptions: [String]
    var studentExaminer: Student?
    var staffExaminer: Staff?
}
