//
//  ViewController.swift
//  App2
//
//  Created by yamamura ryoga on 2021/01/18.
//

import UIKit
import AppCore

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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

