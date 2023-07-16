//
//  MyTableViewCell.swift
//  iOSMVM
//
//  Created by song on 2023/7/14.
//

import UIKit
import RxSwift
import RxRelay
import RxCocoa

class MyTableViewCell: UITableViewCell {

    var disposeBag: DisposeBag! = DisposeBag()
    
    var viewModel: Any? {
        didSet {
            initViewModel(viewModel)
        }
    }
    
    // handle data <-> UI
    func initViewModel(_ value: Any?) {
        
    }
    
    func cleanDiaposableArray() {
        disposeBag = DisposeBag()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        debugPrint("prepareForReuse")
        cleanDiaposableArray()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        cleanDiaposableArray()
        debugPrint("\(self.description) deinit")
    }
    
}
