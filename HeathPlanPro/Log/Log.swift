//
//  Log.swift
//  HeathPlanPro
//
//  Created by Ngọc Hà on 05/07/2025.
//

import Foundation
import RealmSwift

class Log: Object {
    @Persisted var pulse: String
    @Persisted var hrv: String
}
