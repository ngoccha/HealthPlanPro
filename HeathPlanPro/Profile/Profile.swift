//
//  Profile.swift
//  HeathPlanPro
//
//  Created by iKame Elite Fresher 2025 on 7/7/25.
//

import RealmSwift

class Profile: Object, Encodable, Decodable {
    @Persisted var firstName: String
    @Persisted var lastName: String
    @Persisted var bmi: String
    @Persisted var weight: Int
    @Persisted var height: Int
    @Persisted var gender: String
    
    var fullName: String {
        return "\(firstName) \(lastName)"
    }
}
