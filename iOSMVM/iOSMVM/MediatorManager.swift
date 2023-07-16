//
//  MediatorManager.swift
//  iOSMVM
//
//  Created by song on 2023/7/14.
//

import UIKit

class MediatorManager {
    static let shared = MediatorManager()
    var startMediator: StartMediator?
    var upgradeMediator: UpgradeVCMediator?
    var advancedMediator: AdvancedMediator?
    var provinceMediator: ProvinceMediator?
}
