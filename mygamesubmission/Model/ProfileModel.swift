//
//  ProfileModel.swift
//  mygamesubmission
//
//  Created by Fikri Adriansa Yudha on 27/07/20.
//  Copyright © 2020 Fikri Adriansa Yudha. All rights reserved.
//

import Foundation

struct ProfileModel {
    static let nameKey = "name"
    static let emailKey = "email"
    
    static var name: String {
        get {
            return UserDefaults.standard.string(forKey: nameKey) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: nameKey)
        }
    }
    
    static var email: String {
        get {
            return UserDefaults.standard.string(forKey: emailKey) ?? ""
        }
        set {
            UserDefaults.standard.set(newValue, forKey: emailKey)
        }
    }
    
    
    static func deteleAll() -> Bool{
        if let domain = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: domain)
            UserDefaults.standard.synchronize()
            return true
        } else { return false }
    }
    
    static func synchronize() {
        UserDefaults.standard.synchronize()
    }
}
