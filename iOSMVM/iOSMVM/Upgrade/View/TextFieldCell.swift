//
//  TextFieldCell.swift
//  iOSMVM
//
//  Created by song on 2023/7/14.
//

import UIKit

class TextFieldCell: MyTableViewCell {

    let label = UILabel()
    let textField = UITextField()
    
    override func initViewModel(_ value: Any?) {
        guard let model = value as? TextFieldCellViewModel else {
            return
        }
        model.text.bind(to: label.rx.text).disposed(by: disposeBag)
        
        model.value.bind(to: textField.rx.text).disposed(by: disposeBag)
        textField.rx.text.orEmpty.bind(to: model.value).disposed(by: disposeBag)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension TextFieldCell {
    
    func setupUI() {
        label.translatesAutoresizingMaskIntoConstraints = false
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.backgroundColor = .lightGray
        textField.layer.cornerRadius = 8
        textField.layer.shadowColor = UIColor.black.cgColor
        textField.layer.shadowOpacity = 0.2
        textField.layer.shadowOffset = CGSize(width: 0, height: 2)
        textField.layer.shadowRadius = 4
        contentView.addSubview(label)
        contentView.addSubview(textField)
        
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            label.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            textField.leadingAnchor.constraint(equalTo: label.trailingAnchor, constant: 8),
            textField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            textField.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            textField.heightAnchor.constraint(equalToConstant: 44),
            label.widthAnchor.constraint(equalToConstant: 80)
        ])
    }
    
    
}
