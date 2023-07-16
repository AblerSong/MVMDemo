//
//  MoreCell.swift
//  iOSMVM
//
//  Created by song on 2023/7/14.
//

import UIKit

class MoreCell: MyTableViewCell {

    let button = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupComponents()
        
    }
    
    override func initViewModel(_ value: Any?) {
        guard let model = value as? MoreCellViewModel else {
            return
        }
        
        button.rx.tap.subscribe(onNext: {view in
            model.clickItem()
        }).disposed(by: disposeBag)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupComponents() {
        contentView.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        button.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        button.setTitle("click me", for: .normal)
        button.backgroundColor = .lightGray
        button.setTitleColor(.red, for: .normal)
        
    }

}
