//
//  LayoutCellFactory.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/04.
//

import UIKit

class LayoutCellFactory {
    private var viewModel: LayoutViewModel
    
    init(viewModel: LayoutViewModel) {
        self.viewModel = viewModel
    }
    
    var sectionCount: Int {
        return viewModel.sections.count
    }
    
    func rowCount(at index: Int) -> Int {
        let section = viewModel.sections[index]
        
        switch section {
        case .account(let list):
            return list.rowCount
        }
    }
    
    func registerCells(on tableView: UITableView) {
        tableView.register(type: AccountTableViewCell.self)
    }
    
    func dequeueReuseCell(
        tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        let type = viewModel.sections[indexPath.section]
        switch type {
        case .account(let section):
            let cell = tableView.dequeueReusableCell(type: AccountTableViewCell.self, for: indexPath)
            cell.setModel(model: section.displayCellModels[indexPath.row])
            return cell
        }
    }
    
    func footerView(section index: Int) -> UIView? {
        let type = viewModel.sections[index]
        switch type {
        case .account(_):
            let view = ExpandableFooterView(section: index)
            view.delegate = viewModel
            return view
        }
    }
    
    func footerHeight(section index: Int) -> CGFloat {
        let type = viewModel.sections[index]
        switch type {
        case .account(_):
            return 30
        }
    }
    
    func headerView(section index: Int) -> UIView? {
        let type = viewModel.sections[index]
        switch type {
        case .account(_):
            let view = HeaderView(section: index, title: "Expandable Section HeaderView")
            return view
        }
    }
    
    func headerHeight(section index: Int) -> CGFloat {
        let type = viewModel.sections[index]
        switch type {
        case .account(_):
            return 50
        }
    }
}
