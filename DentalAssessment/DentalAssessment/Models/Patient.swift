//
//  Patient.swift
//  DentalAssessment
//
//  Created by student on 08/10/19.
//  Copyright © 2019 student. All rights reserved.
//

import Foundation

struct Patient: Codable {
    var id: String = ""
    var name: String = ""
    var age: Int = 0
    var sex: Int = 0
    var phone: String = ""
    var address: String = ""
    var maritalStatus: Bool?
    var occupation: String?
    
    /*init(id: String, name: String, age: Int, sex: Int, phone: String, address: String, maritalStatus: Bool?, occupation: String?) {
        self.id = id
        self.name = name
        self.age = age
        self.sex = sex
        self.phone = phone
        self.address = address
        self.maritalStatus = maritalStatus
    }
    convenience init(){
        self.init(id: "", name: "", age: 0, sex: 0, phone: "", address: "", maritalStatus: nil, occupation: nil)
    }
    required convenience init?(from dict: [String : Any]) {
        guard let id = dict["id"] as? String else {return nil}
        guard let name = dict["name"] as? String else {return nil}
        guard let age = dict["age"] as? Int else {return nil}
        guard let sex = dict["sex"] as? Int else {return nil}
        guard let phone = dict["phone"] as? String else {return nil}
        guard let address = dict["address"] as? String else {return nil}
        
        self.init(id: id, name: name, age: age, sex: sex, phone: phone, address: address, maritalStatus: dict["maritalStatus"] as? Bool, occupation: dict["occupation"] as? String)
    }
    */
}
