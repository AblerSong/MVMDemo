//
//  StartVC.swift
//  iOSMVM
//
//  Created by song on 2023/7/14.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa

class StartVC: UIViewController {
    
    let disposeBag = DisposeBag()
    var mediator: StartMediator {
        get {
            guard let mediator = MediatorManager.shared.startMediator else {
                let mediator = StartMediator()
                MediatorManager.shared.startMediator = mediator
                return mediator
            }
            return mediator
        }
    }
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mediator.username_value.bind(to: usernameField.rx.text).disposed(by: disposeBag)
        mediator.password_value.bind(to: passwordField.rx.text).disposed(by: disposeBag)
        passwordField.rx.text.orEmpty.bind(to: mediator.password_value).disposed(by: disposeBag)
        usernameField.rx.text.orEmpty.bind(to: mediator.username_value).disposed(by: disposeBag)
    }

    @IBAction func clickLogin(_ sender: Any) {
        mediator.buttonClick()
    }
    
    deinit {
        debugPrint("StartVC")
        MediatorManager.shared.startMediator = nil
    }
}
