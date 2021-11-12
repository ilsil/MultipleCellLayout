//
//  GridCellModel.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/11/07.
//

import Foundation

struct GridCellModel: CellModel {
    let uuid: UUID
    let titles: [String]
    
    init(titles: [String], uuid: UUID = UUID()) {
        self.titles = titles
        self.uuid = uuid
    }
}
