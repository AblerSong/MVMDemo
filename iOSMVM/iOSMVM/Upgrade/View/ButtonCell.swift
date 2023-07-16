//
//  ButtonCell.swift
//  iOSMVM
//
//  Created by song on 2023/7/14.
//

import UIKit

class ButtonCell: MyTableViewCell {
    

    let loginButton = UIButton()
    
    override func initViewModel(_ value: Any?) {
        guard let model = value as? ButtonCellViewModel else {
            return
        }
        
        model.login_btn_disabled.bind(to: loginButton.rx.isEnabled).disposed(by: disposeBag)
        loginButton.rx.tap.subscribe(onNext: { value in
            model.onSubmit()
        }).disposed(by: disposeBag)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        // 设置按钮标题
        loginButton.setTitle("登录", for: .normal)
        
        // 设置按钮字体样式
        loginButton.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        
        // 设置按钮颜色
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.setTitleColor(.lightGray, for: .disabled)
        
        // 设置按钮背景颜色
        loginButton.backgroundColor = UIColor.systemBlue
        
        // 设置按钮圆角
        loginButton.layer.cornerRadius = 8
        loginButton.layer.masksToBounds = true
        
        // 设置按钮大小和位置
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 200),
            loginButton.heightAnchor.constraint(equalToConstant: 44)
        ])
        
        // 设置按钮状态
        loginButton.isEnabled = false
    }

}
