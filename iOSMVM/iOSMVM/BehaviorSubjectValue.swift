//
//  BehaviorSubjectValue.swift
//  iOSMVM
//
//  Created by song on 2023/7/14.
//

import UIKit

import RxSwift
import RxRelay
import RxCocoa
import Toaster

let ToastBehaviorSubject = PublishSubject<String>()

func runToastBehaviorSubject() {
    let _ = ToastBehaviorSubject.subscribe(onNext: {value in
        Toast(text: value).show()
    })
}

let RouterBehaviorSubject = PublishSubject<RouterModel>()
func runRouterBehaviorSubject() {
    let _ = RouterBehaviorSubject.subscribe(onNext: {value in
        if let navVC = Router.shared.getCurrentViewController() as? UINavigationController {
            if value.type == .pop {
                navVC.popViewController(animated: true)
            } else {
                Router.shared.push(value.viewController.init())
            }
        }
    })
}
