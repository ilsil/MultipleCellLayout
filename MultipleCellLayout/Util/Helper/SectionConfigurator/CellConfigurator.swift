//
//  CellConfigurator.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/15.
//

import UIKit

protocol ConfigurableCell {
    associatedtype DataType
    func configure(data: DataType)
}

protocol CellConfigurator {
    static var identifier: String { get }
    func configure(cell: UICollectionViewCell)
}

struct CollectionViewCellConfigurator<CellType: ConfigurableCell, DataType>: CellConfigurator where CellType.DataType == DataType, CellType: UICollectionViewCell {
    
    static var identifier: String { return CellType.identifier }
    
    let item: DataType
    
    init(item: DataType) {
        self.item = item
    }
    
    func configure(cell: UICollectionViewCell) {
        (cell as? CellType)?.configure(data: item)
    }
}
