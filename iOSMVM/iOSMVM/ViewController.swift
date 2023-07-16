//
//  ViewController.swift
//  iOSMVM
//
//  Created by song on 2023/7/14.
//

import UIKit

class ViewController: UITableViewController {
    
    fileprivate let meditor = Meditor()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        tableView.register(TableViewDiffableCell.self, forCellReuseIdentifier: "TableViewDiffableCell")
        dataSource = UITableViewDiffableDataSource(tableView: tableView) { tableView, indexPath, note in
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewDiffableCell", for: indexPath)
            cell.textLabel?.text = note.content
            return cell
        }
        updateData(meditor.cellModelList)
    }
    
    fileprivate func updateData(_ list: [CellModel]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, CellModel>()
        snapshot.appendSections([.main])
        snapshot.appendItems(list)
        dataSource.apply(snapshot, animatingDifferences: false, completion: nil)
    }
    
    private var dataSource: UITableViewDiffableDataSource<Section, CellModel>!
}

extension ViewController {
    public override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let clickItem = self.meditor.cellModelList[indexPath.row].clickCell
        clickItem()
    }
}

fileprivate enum Section {
    case main
}

fileprivate class Meditor {
    fileprivate var cellModelList:[CellModel] = []
    
    init() {
        cellModelList.append(CellModel(idx: 1, content:"start", clickCell: {
            MediatorManager.shared.startMediator = nil
            Router.shared.push(StartVC())
        }))
        cellModelList.append(CellModel(idx: 2, content:"upgrade", clickCell: {
            Router.shared.push(UpgradeVC())
        }))
        cellModelList.append(CellModel(idx: 3, content:"advanced", clickCell: {
            Router.shared.push(AdvancedVC())
        }))
    }
}

fileprivate struct CellModel: Hashable, Equatable {
    var idx: Int
    var content: String
    var clickCell: () -> ()
    
    static func ==(lhs: CellModel, rhs: CellModel) -> Bool {
        return lhs.idx == rhs.idx && lhs.content == rhs.content
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(idx)
        hasher.combine(content)
    }
}


fileprivate class TableViewDiffableCell: UITableViewCell {}

