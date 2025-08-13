//
//  LogRealmManager.swift
//  HeathPlanPro
//
//  Created by iKame Elite Fresher 2025 on 8/13/25.
//

import Foundation
import RealmSwift

final class LogRealmManager {
    static let shared = LogRealmManager()
    
    private let realm: Realm
    
    init() {
        do {
            realm = try Realm()
        } catch {
            fatalError("\(error)")
        }
    }
    
    func add(_ log: Log) {
        do {
            try realm.write {
                realm.add(log)
            }
        } catch {
            print("Error adding object: \(error)")
        }
    }
    
    func getAll(_ type: Log.Type) -> Results<Log> {
        return realm.objects(type)
    }
    
    func delete(_ log: Log) {
        do {
            try realm.write {
                realm.delete(log)
            }
        } catch {
            print("Error deleting object: \(error)")
        }
    }
    
    func update(_ block: () -> Void) {
        do {
            try realm.write {
                block()
            }
        } catch {
            print("Error updating object: \(error)")
        }
    }
}
