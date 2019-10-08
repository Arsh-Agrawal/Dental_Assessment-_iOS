//
//  Patient.swift
//  DentalAssessment
//
//  Created by student on 08/10/19.
//  Copyright © 2019 student. All rights reserved.
//

import Foundation

struct Patient{
    var id: String
    var name: String
    var age: String
    var sex: Int
    var phone: String
    var address: String
    var maritalStatus: Bool?
    var occupation: String?
    init(id: String, name: String, age: String, sex: Int, phone: String, address: String, maritalStatus: Bool?, occupation: String?) {
        self.id = id
        self.name = name
        self.age = age
        self.sex = sex
        self.phone = phone
        self.address = address
        self.maritalStatus = maritalStatus
    }
}
