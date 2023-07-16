//
//  ProvinceCell.swift
//  iOSMVM
//
//  Created by song on 2023/7/14.
//

import UIKit

class ProvinceCell: MyTableViewCell {
    
    override func initViewModel(_ value: Any?) {
        guard let model = value as? ProvinceCellViewModel else { return }
        
        model.value.bind(to: button.rx.title(for: .normal)).disposed(by: disposeBag)
        model.selected.subscribe(onNext: { [unowned self] color in
            button.setTitleColor(color, for: .normal)
        }).disposed(by: disposeBag)
        
        button.rx.tap.subscribe(onNext: {view in
            model.clickItem()
        }).disposed(by: disposeBag)
    }

    let button = UIButton(type: .system)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        button.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(button)
        button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        button.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        button.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
