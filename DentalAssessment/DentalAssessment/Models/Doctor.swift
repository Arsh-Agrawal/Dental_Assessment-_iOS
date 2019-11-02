//
//  Doctor.swift
//  DentalAssessment
//
//  Created by student on 08/10/19.
//  Copyright © 2019 student. All rights reserved.
//

import Foundation

struct Student: Codable{
    var id: String
    var name: String
    var year: Int
    //specialization?
}

struct Staff: Codable{
    var id: String
    var name: String
    var specialization: String
}

