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
        return viewModel.sectionTypes.count
    }
    
    func rowCount(at index: Int) -> Int {
        let type = viewModel.sectionTypes[index]

        switch type {
        case .account(let section):
            return section.rowCount
        }
    }
    
    func registerCells(on collectionView: UICollectionView) {
        collectionView.register(type: AccountCollectionViewCell.self)
        collectionView.registerHeaderView(type: AccountHeaderCollectionReusableView.self)
        collectionView.registerFooterView(type: AccountHeaderCollectionReusableView.self)
    }
    
    func dequeueReuseCell(
        collectionView: UICollectionView,
        cellForRowAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let type = viewModel.sectionTypes[indexPath.section]
        switch type {
        case .account(let section):
            let cell = collectionView.dequeueReusableCell(type: AccountCollectionViewCell.self, for: indexPath)
            cell.setModel(models: section.displayCellModels)
            return cell
        }
    }
    
    func reusableView(collectionView: UICollectionView, kind: String, indexPath: IndexPath) -> UICollectionReusableView {
        let type = viewModel.sectionTypes[indexPath.section]
        switch type {
        case .account(let section):
            if kind == UICollectionView.elementKindSectionHeader {
                let view = collectionView.dequeReusableHeaderView(type: AccountHeaderCollectionReusableView.self, for: indexPath)
                view.titleLabel.text = section.headerModel
                return view
            } else if kind == UICollectionView.elementKindSectionFooter {
                let view = collectionView.dequeReusableFooterView(type: AccountHeaderCollectionReusableView.self, for: indexPath)
                view.titleLabel.text = "Account Section Footer"
                return view
            }
        }
        return UICollectionReusableView()
    }
    
    func cellSize(collectionView: UICollectionView, indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 300)
    }
    
    func headerViewSize(collectionView: UICollectionView, section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
    
    func footerViewSize(collectionView: UICollectionView, section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 50)
    }
}
