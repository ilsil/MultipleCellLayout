//
//  AccountSectionModel.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/04.
//

import Foundation

class AccountSectionModel: SectionModel, HeaderViewModel {
    var headerModel: String
    var displayCellModels: [AccountModel]
    
    var rowCount: Int {
        return 1
    }
    
    init(cellModels: [AccountModel],
         headerModel: String) {
        self.displayCellModels = cellModels
        self.headerModel = headerModel
    }
}
