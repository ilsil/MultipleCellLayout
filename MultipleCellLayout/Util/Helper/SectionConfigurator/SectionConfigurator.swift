//
//  SectionConfigurator.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/15.
//

import UIKit

protocol SectionConfigurator {
    var cellConfigurator: [CellConfigurator] { get set }
    var headerConfigurator: ReusableViewConfigurator? { get }
    var footerConfigurator: ReusableViewConfigurator? { get }
    
    func cellSize(collectionView: UICollectionView, at index: Int) -> CGSize
    func headerSize(collectionView: UICollectionView) -> CGSize
    func footerSize(collectionView: UICollectionView) -> CGSize
}
