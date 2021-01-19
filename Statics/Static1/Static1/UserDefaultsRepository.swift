//
//  UserDefaultsRepository.swift
//  DataStore
//
//  Created by yamamura ryoga on 2021/01/15.
//

import Foundation
import RxSwift

public final class UserDefaultsRepository: UserDefaultsRepositoryProtocol {
    private(set) var dataStore: UserDefaultsDataStoreProtocol
    public init(
        dataStore: UserDefaultsDataStoreProtocol = UserDefaultsDataStore.shared
    ) {
        self.dataStore = dataStore
    }

    public var sample: Single<String> {
        Single.just(dataStore.sample)
    }

    public func setSample(_ newValue: String) {
        dataStore.sample = newValue
    }
}
