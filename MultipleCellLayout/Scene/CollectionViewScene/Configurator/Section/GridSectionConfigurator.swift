//
//  GridSectionConfigurator.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/15.
//

import UIKit

class GridSectionConfigurator: SectionConfigurator,
                               ConfiguratorRegisterable {
    static func register(collectionView: UICollectionView) {
        collectionView.register(identifier: GridCellConfigurator.identifier)
    }
}

