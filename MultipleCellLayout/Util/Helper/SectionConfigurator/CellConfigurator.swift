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

protocol CellConfigurator: Identifier, Uniquely {
    var uuid: UUID { get }
    func configure(cell: UICollectionViewCell)
    func size(containerFrame: CGRect) -> CGSize
}

protocol Uniquely {
    var uuid: UUID { get }
}

protocol CellModel: Equatable, Uniquely {
    var uuid: UUID { get }
}

class CollectionViewCellConfigurator<CellType: ConfigurableCell, DataType:CellModel>: CellConfigurator where CellType.DataType == DataType, CellType: UICollectionViewCell {
    
    var uuid: UUID {
        return item.uuid
    }
    
    static var identifier: String { return CellType.identifier }
    
    var item: DataType
    
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
