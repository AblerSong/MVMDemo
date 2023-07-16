//
//  UpgradeVCMediator.swift
//  iOSMVM
//
//  Created by song on 2023/7/14.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa

let textFieldCellReuseIdentifier = "TextFieldCell"
let buttonCellReuseIdentifier = "ButtonCell"

class BaseMediator: NSObject {
    let disposeBag = DisposeBag()
    let reloadTableView = BehaviorRelay(value: false)
}

class UpgradeVCMediator: BaseMediator {
    let usernameViewModel = TextFieldCellViewModel()
    let passwordViewModel = TextFieldCellViewModel()
    let buttonCellViewModel = ButtonCellViewModel()
    
    lazy var list: [[[String : Any]]] = {
        let arr: [[[String : Any]]] = [
            [
                ["model":usernameViewModel,"reuseIdentifier":textFieldCellReuseIdentifier],
                ["model":passwordViewModel,"reuseIdentifier":textFieldCellReuseIdentifier],
            ],
            [
                ["model":buttonCellViewModel,"reuseIdentifier":buttonCellReuseIdentifier]
            ]
        ]
        return arr
    }()
    
    override init() {
        super.init()
        
        initPasswordViewModel()
        initUsernameViewModel()
        initButtonCellViewModel()
    }
    
    func initUsernameViewModel() {
        usernameViewModel.text.accept("username")
    }
    func initPasswordViewModel() {
        passwordViewModel.text.accept("password")
    }
    func initButtonCellViewModel() {
        let combineLatest = Observable.combineLatest(usernameViewModel.value, passwordViewModel.value)
        
        combineLatest.map { (username: String, password: String) -> Bool in
            return username.count > 0 && password.count > 0
        }.bind(to: buttonCellViewModel.login_btn_disabled).disposed(by: disposeBag)
        
        
        buttonCellViewModel.onSubmit = {
            combineLatest.subscribe( onNext: { (username: String, password: String) in
                if username == "Admin", password == "123456" {
                    RouterBehaviorSubject.onNext(RouterModel(type: .pop))
                } else {
                    ToastBehaviorSubject.onNext("input error")
                }
            }).dispose()
        }
    }
}
