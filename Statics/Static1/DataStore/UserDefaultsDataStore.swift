//
//  UserDefaultsDataStore.swift
//  DataStore
//
//  Created by yamamura ryoga on 2021/01/15.
//

import Foundation

public final class UserDefaultsDataStore: UserDefaultsDataStoreProtocol {
    private init() {}
    public static let shared = UserDefaultsDataStore()

    public func remove<T>(type: UserDefaultsType<T>) {
        let wrapper = UserDefaultsWrapper<T>(type: type)
        wrapper.removeObject()
    }

    @UserDefaultsWrapper(type: .sample)
    public var sample: String

}
