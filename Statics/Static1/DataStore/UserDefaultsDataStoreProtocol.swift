//
//  UserDefaultsDataStoreProtocol.swift
//  DataStore
//
//  Created by yamamura ryoga on 2021/01/15.
//

import Foundation

public protocol UserDefaultsDataStoreProtocol {
    func remove<T>(type: UserDefaultsType<T>)

    var sample: String { get set }
}
