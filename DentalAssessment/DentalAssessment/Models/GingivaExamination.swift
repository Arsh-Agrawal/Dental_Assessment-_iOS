//
//  GingivaExamination.swift
//  DentalAssessment
//
//  Created by student on 08/10/19.
//  Copyright © 2019 student. All rights reserved.
//

import Foundation

struct GingivaExamination: Codable{
    var color: String = ""
    var contour: String = ""
    var position: String = ""
    var surfaceTexture: String = ""
    var consistency: String = ""
    var bleedingOnProbing: Bool = false
    var periodontalPockets: String = ""
}
