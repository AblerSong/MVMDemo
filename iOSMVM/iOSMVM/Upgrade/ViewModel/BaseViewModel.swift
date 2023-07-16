//
//  BaseViewModel.swift
//  iOSMVM
//
//  Created by song on 2023/7/14.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa

class BaseViewModel: NSObject {
    let reloadTableView = BehaviorRelay(value: false)
    var disposeBag = DisposeBag()
    
    deinit {
        debugPrint("\(self.description) deinit")
    }
}
