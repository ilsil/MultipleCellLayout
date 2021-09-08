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

enum BankingSectionType {
    case account(AccountSectionModel)
//    case myMenu(MymenuSection)
}

class LayoutViewModel {
    weak var delegate: ReloadTableDelegate?
    var sectionTypes: [BankingSectionType] = []
    
    init() {
        setTempData()
    }
    
    private func setTempData() {
        let accountSectionModel = AccountSectionModel(
            cellModels: [
                AccountModel(account: "110-100", money: "2,000"),
                AccountModel(account: "210-100", money: "5,000"),
                AccountModel(account: "310-100", money: "12,000")
            ],
            headerModel: "Section Header"
        )
        sectionTypes.append(.account(accountSectionModel))
    }
}

extension LayoutViewModel: ExpandableSectionDelegate {
    func expand(section index: Int) {
        let type = sectionTypes[index]
        
//        if case let .account(item) = type {
//            item.isExpandable.toggle()
//            delegate?.reloadTable(sections: [index])
//        }
    }
}
