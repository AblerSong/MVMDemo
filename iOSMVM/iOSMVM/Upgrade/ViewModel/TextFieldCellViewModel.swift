//
//  TextFieldCellViewModel.swift
//  iOSMVM
//
//  Created by song on 2023/7/14.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa

class TextFieldCellViewModel: BaseViewModel {
    let text = BehaviorRelay(value: "")
    let value = BehaviorRelay(value: "")
}
