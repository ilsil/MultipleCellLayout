//
//  AccountSectionConfigurator.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/15.
//

import UIKit

/// Cell Config
typealias AccountCellConfig = CollectionViewCellConfigurator<AccountCollectionViewCell, [AccountModel]>
/// Header Config
typealias AccountHeaderConfig = CollectionReusableViewConfigurator<AccountHeaderCollectionReusableView, String>

class AccountSectionConfigurator: SectionConfigurator {
    var cellConfigurator: [CellConfigurator]
    var headerConfigurator: ReusableViewConfigurator?
    var footerConfigurator: ReusableViewConfigurator?
    
    init(cellConfigurator: [AccountCellConfig],
         headerConfigurator: AccountHeaderConfig) {
        self.cellConfigurator = cellConfigurator
        self.headerConfigurator = headerConfigurator
    }
    
    func cellSize(collectionView: UICollectionView, at index: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 300)
    }
    
    func headerSize(collectionView: UICollectionView) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    func footerSize(collectionView: UICollectionView) -> CGSize {
        return .zero
    }
}
