//
//  IntraoralExamination.swift
//  DentalAssessment
//
//  Created by student on 08/10/19.
//  Copyright © 2019 student. All rights reserved.
//

import Foundation

struct IntraoralExamination: Codable{
    var hygieneStatus: String = ""
    var halitosis: Bool = false         //bad breath
    var stains: Bool = false            //stains on tooth
    var calculus: Bool = false          //calcified tartar deposits
    var softTissue: SoftTissueExamination = SoftTissueExamination()
    //var hardTissue: HardTissueExamination = HardTissueExamination()
    var hardTissue: [String] = []
    var specificFindings: String = ""
}
