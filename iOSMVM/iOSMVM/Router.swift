//
//  Router.swift
//  iOSMVM
//
//  Created by song on 2023/7/14.
//

import UIKit

class Router {
    static let shared = Router()  // 单例模式
    
    private init() {}
    
    func push(_ viewController: UIViewController) {
        guard let currentViewController: UINavigationController = getCurrentViewController() as? UINavigationController else {
            return
        }
        currentViewController.pushViewController(viewController, animated: true)
    }
    
    func present(_ viewController: UIViewController) {
        guard let currentViewController = getCurrentViewController() else {
            return
        }
        currentViewController.present(viewController, animated: true)
    }
    
    func getCurrentViewController() -> UIViewController? {
        guard let keyWindow = UIApplication.shared.keyWindow,
              let rootViewController = keyWindow.rootViewController else {
            return nil
        }
        
        var currentViewController: UIViewController? = rootViewController
        while let presentedViewController = currentViewController?.presentedViewController {
            currentViewController = presentedViewController
        }
        
        return currentViewController
    }
    
    // 添加其他控制器跳转的方法
}

struct RouterModel {
    enum RouterType {
        case pop, push
    }
    var type = RouterType.pop
    var viewController: UIViewController.Type = UIViewController.self
}
