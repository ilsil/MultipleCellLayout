//
//  TileCellModel.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/11/07.
//

import Foundation

struct TileCellModel: CellModel {
    let uuid: UUID
    let title: String
    
    init(title: String, uuid: UUID = UUID()) {
        self.title = title
        self.uuid = uuid
    }
}
