//
//  MoreCellViewModel.swift
//  iOSMVM
//
//  Created by song on 2023/7/14.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa


class MoreCellViewModel: BaseViewModel {
    var moreTag = false
    func clickItem() {
        moreTag = !moreTag
        reloadTableView.accept(true)
    }
}
