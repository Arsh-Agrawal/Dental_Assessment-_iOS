//
//  Doctor.swift
//  DentalAssessment
//
//  Created by student on 08/10/19.
//  Copyright © 2019 student. All rights reserved.
//

import Foundation

class Doctor{
    var id: String
    var name: String
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

class Student: Doctor{
    var year: Int
    //specialization?
    init(id: String, name: String, year: Int){
        self.year = year
        super.init(id: id, name: name)
    }
}

class Staff: Doctor{
    var specialization: String
    init(id: String, name: String, specialization: String){
        self.specialization = specialization
        super.init(id: id, name: name)
    }
}

