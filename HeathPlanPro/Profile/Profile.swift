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
    var weight: Int
    var height: Int
    var gender: String
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
}
