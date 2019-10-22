//
//  DocumentSerializable.swift
//  DentalAssessment
//
//  Created by student on 22/10/19.
//  Copyright © 2019 student. All rights reserved.
//

import Foundation

protocol DocumentSerializable {
    init?(from: [String: Any]) //allow initiallizing from a deserialized dictionary
}
