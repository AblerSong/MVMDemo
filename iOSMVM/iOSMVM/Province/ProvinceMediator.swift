//
//  ProvinceMediator.swift
//  iOSMVM
//
//  Created by song on 2023/7/14.
//

import UIKit

class ProvinceMediator: NSObject {
    
    func getDataList() -> [ProvinceCellViewModel] {
        let data = provinceList.data(using: String.Encoding.utf8)
        let jsonArr = try! JSONSerialization.jsonObject(with: data!,options: JSONSerialization.ReadingOptions.mutableContainers) as! [[String: Any]]
        let arr = jsonArr.map { dict -> ProvinceCellViewModel in
            let model = ProvinceCellViewModel()
            let province = dict["province"] as? String ?? ""
            
            model.value.accept(province)
            
            // click
            model.clickItem = {
                RouterBehaviorSubject.onNext(RouterModel(type: .pop))
                MediatorManager.shared.advancedMediator?.province.value.accept(province)
            }
            return model
        }
        return arr
    }
    
    func viewWillAppear() {
        list.forEach { model in
            if MediatorManager.shared.advancedMediator?.province.value.value == model.value.value {
                model.selected.accept(.red)
            } else {
                model.selected.accept(.black)
            }
        }
    }

    lazy var list:[ProvinceCellViewModel] = getDataList()
}
