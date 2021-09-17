//
//  TileSectionConfigurator.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/15.
//

import UIKit

class TileSectionConfigurator: SectionConfigurator,
                               ConfiguratorRegisterable {
    static func register(collectionView: UICollectionView) {
        collectionView.register(identifier: TileCellConfigurator.identifier)
        collectionView.register(identifier: TileImageCellConfigurator.identifier)
    }
}
