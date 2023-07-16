//
//  ProvinceVC.swift
//  iOSMVM
//
//  Created by song on 2023/7/14.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa

class ProvinceVC: UITableViewController {
    
    let disposeBag = DisposeBag()
    
    var mediator: ProvinceMediator {
        get {
            guard let mediator = MediatorManager.shared.provinceMediator else {
                let mediator = ProvinceMediator()
                MediatorManager.shared.provinceMediator = mediator
                return mediator
            }
            return mediator
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(ProvinceCell.self, forCellReuseIdentifier: "ProvinceCell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mediator.viewWillAppear()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mediator.list.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProvinceCell", for: indexPath) as! MyTableViewCell
        let model = mediator.list[indexPath.row]
        cell.viewModel = model
        return cell
    }

}
