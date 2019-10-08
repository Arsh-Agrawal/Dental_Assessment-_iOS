//
//  IntraoralExamination.swift
//  DentalAssessment
//
//  Created by student on 08/10/19.
//  Copyright © 2019 student. All rights reserved.
//

import Foundation

struct IntraoralExamination{
    var hygeneStatus: String
    var halitosis: Bool         //bad breath
    var stains: Bool            //stains on tooth
    var calculus: Bool          //calcified tartar deposits
    var softTissue: SoftTissueExamination
    var hardTisseu: HardTissueExamination
    var specificFindings: String
}
