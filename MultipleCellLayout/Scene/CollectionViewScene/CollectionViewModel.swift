//
//  CollectionViewModel.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/08.
//

import Foundation

enum CollectionViewSectionType {
    case account(AccountSectionModel)
}

class CollectionViewModel {
    var sectionTypes: [CollectionViewSectionType] = []
    
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
            headerModel: "Account Section Header"
        )
        sectionTypes.append(.account(accountSectionModel))
    }
}
