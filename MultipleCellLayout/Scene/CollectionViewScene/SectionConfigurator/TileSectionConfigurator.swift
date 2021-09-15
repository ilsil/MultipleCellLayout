//
//  TileSectionConfigurator.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/15.
//

import UIKit

/// Cell Config
typealias TileCellConfig = CollectionViewCellConfigurator<TileCollectionViewCell, String>

class TileSectionConfigurator: SectionConfigurator {
    var cellConfigurator: [CellConfigurator]
    var headerConfigurator: ReusableViewConfigurator?
    var footerConfigurator: ReusableViewConfigurator?
    
    
    init(cellConfigurator: [TileCellConfig]) {
        self.cellConfigurator = cellConfigurator
    }
    
    func cellSize(collectionView: UICollectionView, at index: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width/2, height: 50)
    }
    
    func headerSize(collectionView: UICollectionView) -> CGSize {
        return .zero
    }
    
    func footerSize(collectionView: UICollectionView) -> CGSize {
        return .zero
    }
}
