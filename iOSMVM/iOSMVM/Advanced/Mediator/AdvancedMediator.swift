//
//  AdvancedMediator.swift
//  iOSMVM
//
//  Created by song on 2023/7/14.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa

class AdvancedMediator: BaseMediator {
    let price1 = TextFieldCellViewModel()
    let price2 = TextFieldCellViewModel()
    let total = TextFieldCellViewModel()
    let expand = ExpandCellViewModel()
    let more = MoreCellViewModel()
    let province = ProvinceCellViewModel()
    
    override init() {
        super.init()
        
        price1.text.accept("price1")
        price2.text.accept("price2")
        total.text.accept("total: ")
        
        Observable.combineLatest(price1.value, price2.value).subscribe( onNext: { [unowned self] (value1: String, value2: String) in
            total.value.accept(String((Int(value1) ?? 0) + (Int(value2) ?? 0)))
        }).disposed(by: disposeBag)
        
        expand.reloadTableView.bind(to: reloadTableView).disposed(by: disposeBag)
        more.reloadTableView.bind(to: reloadTableView).disposed(by: disposeBag)
    }
    
    var list: [[[String : Any]]] {
        get {
            var arr: [[[String : Any]]] = [
                [
                    ["model":price1,"reuseIdentifier":textFieldCellReuseIdentifier],
                    ["model":price2,"reuseIdentifier":textFieldCellReuseIdentifier],
                ],
                [
                    ["model":total,"reuseIdentifier":textFieldCellReuseIdentifier]
                ],
                [
                    ["model":more,"reuseIdentifier":"MoreCell"]
                ],
                [
                    ["model":expand,"reuseIdentifier":"ExpandCell"]
                ],
                [
                    ["model":province,"reuseIdentifier":"ProvinceCell"]
                ],
            ]
            
            if more.moreTag {
                let l: [[[String : Any]]] = [[
                    ["model":total,"reuseIdentifier":textFieldCellReuseIdentifier]
                ]]
                arr = arr + l
            } else {
                
            }
            return arr
        }
    }
}
