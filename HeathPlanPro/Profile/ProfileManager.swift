//
//  ProfileManager.swift
//  HeathPlanPro
//
//  Created by iKame Elite Fresher 2025 on 7/7/25.
//

import Foundation

class ProfileManager {
    static let shared = ProfileManager()
    private let profileKey = "savedProfile"

    func saveProfile(_ profile: Profile) {
        if let encoded = try? JSONEncoder().encode(profile) {
            UserDefaults.standard.set(encoded, forKey: profileKey)
        }
    }

    func loadProfile() -> Profile? {
        if let savedData = UserDefaults.standard.data(forKey: profileKey),
           let loadedProfile = try? JSONDecoder().decode(Profile.self, from: savedData) {
            return loadedProfile
        }
        return nil
    }

    func hasProfile() -> Bool {
        return loadProfile() != nil
    }
}
