//
//  ExpandCellViewModel.swift
//  iOSMVM
//
//  Created by song on 2023/7/14.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa


class ExpandCellViewModel: BaseViewModel {
    var height: CGFloat = 150;
    
    func clickItem() {
        height = (height == 150) ? 300 : 150
        reloadTableView.accept(true)
    }
}
