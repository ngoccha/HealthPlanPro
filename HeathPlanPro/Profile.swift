//
//  Profile.swift
//  HeathPlanPro
//
//  Created by iKame Elite Fresher 2025 on 7/7/25.
//


struct Profile: Encodable, Decodable {
    var firstName: String
    var lastName: String
    var bmi: String
    var weight: String
    var height: String
    var gender: String
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
}
