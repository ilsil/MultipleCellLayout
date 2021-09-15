//
//  CollectionViewFactory.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/08.
//

import UIKit

class CollectionViewFactory {
    private let viewModel: CollectionViewModel
    
    init(viewModel: CollectionViewModel) {
        self.viewModel = viewModel
    }
    
    var sectionCount: Int {
        return viewModel.configurators.count
    }
    
    func rowCount(at index: Int) -> Int {
        return viewModel.configurators[index].cellConfigurator.count
    }
    
    func registerCells(on collectionView: UICollectionView) {
        collectionView.register(identifier: AccountCellConfig.identifier)
        collectionView.register(identifier: TileCellConfig.identifier)
        collectionView.register(identifier: GridCellConfig.identifier)
        
        collectionView.registerHeaderView(identifier: AccountHeaderConfig.identifier)
        collectionView.registerFooterView(identifier: AccountHeaderConfig.identifier)
    }
    
    func dequeueReuseCell(
        collectionView: UICollectionView,
        cellForRowAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let item = viewModel.configurators[indexPath.section]
        let cellConfigurator = item.cellConfigurator[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: type(of:cellConfigurator).identifier, for: indexPath)
        item.cellConfigurator[indexPath.row].configure(cell: cell)
        return cell
    }
    
    func reusableView(collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            if let headerConfigurator = viewModel.configurators[indexPath.section].headerConfigurator {
                let identifier = type(of: headerConfigurator).identifier
                let view = collectionView.dequeReusableHeaderView(identifer: identifier, for: indexPath)
                headerConfigurator.configure(cell: view)
                return view
            }
        } else if kind == UICollectionView.elementKindSectionFooter {
            if let footerConfigurator = viewModel.configurators[indexPath.section].footerConfigurator {
                let identifier = type(of: footerConfigurator).identifier
                let view = collectionView.dequeReusableFooterView(identifer: identifier, for: indexPath)
                footerConfigurator.configure(cell: view)
                return view
            }
        }
        return UICollectionReusableView()
    }
    
    func cellSize(collectionView: UICollectionView, indexPath: IndexPath) -> CGSize {
        return viewModel.configurators[indexPath.section].cellSize(collectionView: collectionView, at: indexPath.row)
    }
    
    func headerViewSize(collectionView: UICollectionView, section: Int) -> CGSize {
        return viewModel.configurators[section].headerSize(collectionView: collectionView)
    }
    
    func footerViewSize(collectionView: UICollectionView, section: Int) -> CGSize {
        return viewModel.configurators[section].footerSize(collectionView: collectionView)
    }
}
