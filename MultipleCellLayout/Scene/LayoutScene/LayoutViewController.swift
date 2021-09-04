//
//  LayoutViewController.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/04.
//

import UIKit

protocol ReloadTableDelegate: class {
    func reloadTable(sections: IndexSet)
}

class LayoutViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = LayoutViewModel()
    var factory: LayoutCellFactory!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        factory = LayoutCellFactory(viewModel: viewModel)
        factory.registerCells(on: tableView)
        setTableView()
    }
    
    private func setTableView() {
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.separatorStyle = .none
    }
}

extension LayoutViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return factory.sectionCount
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return factory.rowCount(at: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return factory.dequeueReuseCell(tableView: tableView, cellForRowAt: indexPath)
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return factory.footerView(section: section)
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return factory.footerHeight(section: section)
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return factory.headerView(section: section)
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return factory.headerHeight(section: section)
    }
}

extension LayoutViewController: ReloadTableDelegate {
    func reloadTable(sections: IndexSet) {
        tableView.reloadSections(sections, with: .automatic)
    }
}
