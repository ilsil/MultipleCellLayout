//
//  LayoutViewModel.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/04.
//

import Foundation

protocol ExpandableSectionDelegate: class {
    func expand(section: Int)
}

enum BankingSection {
    case account(AccountSection)
//    case myMenu(MymenuSection)
}

class LayoutViewModel {
    weak var delegate: ReloadTableDelegate?
    var sections: [BankingSection] = []
    
    init() {
        setTempData()
    }
    
    private func setTempData() {
        let accountSection = AccountSection(
            models: [
                AccountModel(account: "110-100", money: "2,000"),
                AccountModel(account: "210-100", money: "5,000"),
                AccountModel(account: "310-100", money: "12,000")
            ]
        )
        sections.append(.account(accountSection))
    }
}

extension LayoutViewModel: ExpandableSectionDelegate {
    func expand(section index: Int) {
        let section = sections[index]
        
        if case let .account(item) = section {
            item.isExpandable.toggle()
            delegate?.reloadTable(sections: [index])
        }
    }
}
