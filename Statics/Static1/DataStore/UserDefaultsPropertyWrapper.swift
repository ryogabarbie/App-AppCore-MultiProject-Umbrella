//
//  UserDefaultsPropertyWrapper.swift
//  DataStore
//
//  Created by yamamura ryoga on 2021/01/15.
//

import Foundation

public final class UserDefaultsType<T>: UserDefaultsKeys {
    let key: String
    let defaultValue: T

    init(
        key: String,
        defaultValue: T
    ) {
        self.key = key
        self.defaultValue = defaultValue
    }

    init(
        key: String,
        defaultValue: T = nil
    ) where T: ExpressibleByNilLiteral {
        self.key = key
        self.defaultValue = defaultValue
    }
}

@propertyWrapper
public struct UserDefaultsWrapper<T> {
    private let type: UserDefaultsType<T>
    private let userDefaults: UserDefaults

    init(
        type: UserDefaultsType<T>,
        userDefaults: UserDefaults = UserDefaults.standard
    ) {
        self.type = type
        self.userDefaults = userDefaults
    }

    private var _cachedValue: T?

    public var wrappedValue: T {
        get {
            if let value = _cachedValue {
                return value
            } else if let value = userDefaults.object(forKey: type.key) as? T {
                return value
            } else {
                return type.defaultValue
            }
        }
        set {
            userDefaults.setValue(newValue, forKey: type.key)
            _cachedValue = newValue
        }
    }

    public func removeObject() {
        userDefaults.removeObject(forKey: type.key)
    }
}
