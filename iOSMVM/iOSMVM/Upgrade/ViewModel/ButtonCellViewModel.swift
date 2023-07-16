//
//  ButtonCellViewModel.swift
//  iOSMVM
//
//  Created by song on 2023/7/14.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa


class ButtonCellViewModel: BaseViewModel {
    let login_btn_disabled = BehaviorRelay(value: false)
    var onSubmit = {}
}
