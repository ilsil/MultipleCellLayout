//
//  AccountModel.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/04.
//

import Foundation

struct Account: Equatable {
    var accountNumber: String
    var money: String
}

struct AccountCellModel: CellModel {
    let uuid: UUID
    let accounts: [Account]
    
    init(accounts: [Account], uuid: UUID = UUID()) {
        self.uuid = uuid
        self.accounts = accounts
    }
}
