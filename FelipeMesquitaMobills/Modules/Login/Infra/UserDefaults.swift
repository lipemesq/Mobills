//
//  UserDefaults.swift
//  FelipeMesquitaMobills
//
//  Created by Felipe Mesquita on 24/05/21.
//

import Foundation

extension UserDefaults {
    struct Key<Value> {
        var name: String
    }
    
    subscript<T>(key: Key<T>) -> T? {
        get {
            return value(forKey: key.name) as? T
        }
        set {
            setValue(newValue, forKey: key.name)
        }
    }
    
    subscript<T>(key: Key<T>, default defaultProvider: @autoclosure () -> T) -> T {
        get {
            return value(forKey: key.name) as? T
                ?? defaultProvider()
        }
        set {
            setValue(newValue, forKey: key.name)
        }
    }
    
    func get<T>(codableKey: Key<T>) -> T? where T: Codable {
        if let savedData = object(forKey: codableKey.name) as? Data {
            let decoder = JSONDecoder()
            if let loadedData = try? decoder.decode(T.self, from: savedData) {
                return loadedData
            }
        }
        return nil
    }
    
    func set<T>(codableKey: Key<T>, value: T?) where T: Codable {
        guard let value = value else {
            set(nil, forKey: codableKey.name)
            return
        }
        
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(value) {
            set(encoded, forKey: codableKey.name)
        }
        else {
            print("Failed to save \(value) of key \(codableKey.name) on UserDefaults")
        }
    }
    
    subscript<T>(codableKey: Key<T>, default defaultProvider: @autoclosure () -> T) -> T where T: Codable {
        get {
            if let savedData = object(forKey: codableKey.name) as? Data {
                let decoder = JSONDecoder()
                if let loadedData = try? decoder.decode(T.self, from: savedData) {
                    return loadedData
                }
            }
            return defaultProvider()
            //return (value(forKey: key.name) as? T) ?? defaultProvider()
        }
        set {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(newValue) {
                set(encoded, forKey: codableKey.name)
            }
            else {
                print("Failed to save \(newValue) of key \(codableKey.name) on UserDefaults")
            }
            //setValue(newValue, forKey: key.name)
        }
    }
}

extension UserDefaults.Key {
    static var loggedUser: UserDefaults.Key<UserData> {
        return .init(name: "user.logged")
    }
}
