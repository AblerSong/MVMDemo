//
//  UpgradeVC.swift
//  iOSMVM
//
//  Created by song on 2023/7/14.
//

import UIKit

class UpgradeVC: UITableViewController {
    var mediator: UpgradeVCMediator {
        get {
            guard let mediator = MediatorManager.shared.upgradeMediator else {
                let mediator = UpgradeVCMediator()
                MediatorManager.shared.upgradeMediator = mediator
                return mediator
            }
            return mediator
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(TextFieldCell.self, forCellReuseIdentifier: textFieldCellReuseIdentifier)
        tableView.register(ButtonCell.self, forCellReuseIdentifier: buttonCellReuseIdentifier)
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
    
    deinit {
        MediatorManager.shared.upgradeMediator = nil
    }

}
