//
//  PatientAppointment.swift
//  DentalAssessment
//
//  Created by student on 08/10/19.
//  Copyright © 2019 student. All rights reserved.
//

import Foundation

struct PatientAppointment: Codable{
    var id: String
    var patient: Patient
    var date: Date
    var department: String
    /*init(id: String, patient: Patient, date: Date, department: String){
        self.id = id
        self.patient = patient
        self.date = date
        self.department = department
    }
    */
}
