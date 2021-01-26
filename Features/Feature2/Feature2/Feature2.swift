//
//  Feature2.swift
//  Feature2
//
//  Created by yamamura ryoga on 2021/01/26.
//

import AppCore

public class Feature2 {
    public static func hoge() {
        Observable.just("just")
            .subscribe(onNext: { string in
                print(string)
            })
            .dispose()

        let repo = UserDefaultsRepository()
        repo.setSample("haraheri")
        repo.sample
            .subscribe({ string in
                print(string)
            })
            .dispose()

        print(APIKit.Session.self)
    }
}
