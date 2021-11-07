//
//  GridCellConfigurator.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/17.
//

import UIKit

class GridCellConfigurator: CollectionViewCellConfigurator<GridCollectionViewCell, GridCellModel> {
    override func size(containerFrame: CGRect) -> CGSize {
        let frame = CGRect(x: 0, y: 0, width: containerFrame.width, height: 10)
        let dummyCell = GridCollectionViewCell(frame: frame)
        dummyCell.configure(data: item)
        return dummyCell.systemLayoutSizeFitting(frame.size)
    }
}
