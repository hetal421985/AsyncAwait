//
//  PatientDetail.swift
//  DemoAsynAwiatLetTaskGroup
//
//  Created by Hetal Mehta on 29/03/24.
//

import Foundation

struct PatientDetail: Decodable {
    
    /// City
    var city: String
    ///  Country
    var country: String
    /// Gender
    var gender: String
    /// ID
    var patient_id: String
    /// Birth Year
    var year_of_birth: Int
}
