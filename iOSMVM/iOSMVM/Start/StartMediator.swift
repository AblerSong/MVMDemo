//
//  StartMediator.swift
//  iOSMVM
//
//  Created by song on 2023/7/14.
//

import UIKit

import RxSwift
import RxRelay
import RxCocoa

class StartMediator {
    let username_str = BehaviorRelay(value: "username")
    let password_str = BehaviorRelay(value: "password")
    let username_value = BehaviorRelay(value: "")
    let password_value = BehaviorRelay(value: "")
    
    func buttonClick() {
        if username_value.value == "admin" && password_value.value == "123456" {
            RouterBehaviorSubject.onNext(RouterModel(type: .pop))
            return
        }
        ToastBehaviorSubject.onNext("input error")
    }
    
    deinit {
        debugPrint("StartMediator")
    }
}
