//
//  GridSectionConfigurator.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/15.
//

import UIKit

/// Cell Config
typealias GridCellConfig = CollectionViewCellConfigurator<GridCollectionViewCell, [String]>

class GridSectionConfigurator: SectionConfigurator {
    var cellConfigurator: [CellConfigurator]
    var headerConfigurator: ReusableViewConfigurator?
    var footerConfigurator: ReusableViewConfigurator?
    
    init(cellConfigurator: [GridCellConfig]) {
        self.cellConfigurator = cellConfigurator
    }
    
    func cellSize(collectionView: UICollectionView, at index: Int) -> CGSize {
        //TODO: 동적으로 Size 구하는 로직 적용하기
//        if let cellConfig = cellConfigurator[index] as? GridCellConfig {
//            let dummyCell = GridCollectionViewCell(frame: CGRect(x: 0, y: 0, width: collectionView.frame.width, height: 10))
//            dummyCell.configure(data: cellConfig.item)
//            dummyCell.layoutIfNeeded()
//            return CGSize(width: collectionView.frame.width, height: dummyCell.collectionView.contentSize.height)
//        }
        return .zero
    }
    
    func headerSize(collectionView: UICollectionView) -> CGSize {
        return .zero
    }
    
    func footerSize(collectionView: UICollectionView) -> CGSize {
        return .zero
    }
}
