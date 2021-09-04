//
//  AccountSection.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/04.
//

import Foundation

class AccountSection: ExpandableSectionType {
    typealias CellModel = AccountModel
    var totalModels: [AccountModel]
    var initialCount: Int = 1
    var isExpandable: Bool = false
    
    init(models: [AccountModel]) {
        self.totalModels = models
    }
}
