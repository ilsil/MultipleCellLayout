//
//  ReusableViewConfigurator.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/15.
//

import UIKit

protocol ConfigurableReusableView {
    associatedtype DataType
    func configure(data: DataType)
}

protocol ReusableViewConfigurator {
    static var identifier: String { get }
    func configure(cell: UICollectionReusableView)
}

struct CollectionReusableViewConfigurator<ViewType: ConfigurableReusableView, DataType>: ReusableViewConfigurator where ViewType.DataType == DataType, ViewType: UICollectionReusableView {
    static var identifier: String { return ViewType.identifier }
    let item: DataType
    
    init(item: DataType) {
        self.item = item
    }
    
    func configure(cell: UICollectionReusableView) {
        (cell as? ViewType)?.configure(data: item)
    }
}
