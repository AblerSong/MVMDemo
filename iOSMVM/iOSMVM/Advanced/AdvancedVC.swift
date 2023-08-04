//
//  AdvancedVC.swift
//  iOSMVM
//
//  Created by song on 2023/7/14.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa

class AdvancedVC: UITableViewController {
    let disposeBag = DisposeBag()
    
    var mediator: AdvancedMediator {
        get {
            guard let mediator = MediatorManager.shared.advancedMediator else {
                let mediator = AdvancedMediator()
                MediatorManager.shared.advancedMediator = mediator
                return mediator
            }
            return mediator
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(TextFieldCell.self, forCellReuseIdentifier: textFieldCellReuseIdentifier)
        tableView.register(ExpandCell.self, forCellReuseIdentifier: "ExpandCell")
        tableView.register(MoreCell.self, forCellReuseIdentifier: "MoreCell")
        tableView.register(ProvinceCell.self, forCellReuseIdentifier: "ProvinceCell")
        
        mediator.reloadTableView.subscribe(onNext: {[unowned self] value in
            if value {
                tableView.reloadData()
            }
        }).disposed(by: disposeBag)
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return mediator.list.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let list = mediator.list[section]
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let list = mediator.list[indexPath.section]
        if let model = list[indexPath.row]["model"] as? ExpandCellViewModel {
            return model.height
        }
        return 80
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let list = mediator.list[indexPath.section]
        let reuseIdentifier = list[indexPath.row]["reuseIdentifier"] as! String
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! MyTableViewCell
        let model = list[indexPath.row]["model"]
        cell.viewModel = model
        return cell
    }

}
