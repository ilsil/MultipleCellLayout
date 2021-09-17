//
//  CellConfigurator.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/15.
//

import UIKit

protocol Identifier {
    static var identifier: String { get }
}

protocol ConfigurableCell {
    associatedtype DataType
    func configure(data: DataType)
}

protocol CellConfigurator: Identifier {
    func configure(cell: UICollectionViewCell)
    func size(containerFrame: CGRect) -> CGSize
}

class CollectionViewCellConfigurator<CellType: ConfigurableCell, DataType>: CellConfigurator where CellType.DataType == DataType, CellType: UICollectionViewCell {
    
    static var identifier: String { return CellType.identifier }
    
    let item: DataType
    
    init(item: DataType) {
        self.item = item
    }
    
    func configure(cell: UICollectionViewCell) {
        (cell as? CellType)?.configure(data: item)
    }
    
    func size(containerFrame: CGRect) -> CGSize {
        return .zero
    }
}
