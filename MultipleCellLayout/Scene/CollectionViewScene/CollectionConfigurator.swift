//
//  CollectionConfigurator.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/08.
//

import UIKit

class CollectionConfigurator {
    private var viewModel: ConfiguratorViewModelType
    
    init(viewModel: ConfiguratorViewModelType) {
        self.viewModel = viewModel
    }
    
    var numberOfSections: Int {
        return viewModel.configurators.count
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return viewModel.configurators[section].rowCount()
    }
    
    func dequeueReuseCell(_ collectionView: UICollectionView, cellForRowAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = viewModel.configurators[indexPath.section]
        let cellConfigurator = item.cellConfigurator[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: type(of:cellConfigurator).identifier, for: indexPath)
        item.cellConfigurator[indexPath.row].configure(cell: cell)
        return cell
    }
    
    func dequeueReusableView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            if let headerConfigurator = viewModel.configurators[indexPath.section].headerConfigurator {
                let identifier = type(of: headerConfigurator).identifier
                let view = collectionView.dequeueReusableHeaderView(identifer: identifier, for: indexPath)
                headerConfigurator.configure(cell: view)
                return view
            }
        } else if kind == UICollectionView.elementKindSectionFooter {
            if let footerConfigurator = viewModel.configurators[indexPath.section].footerConfigurator {
                let identifier = type(of: footerConfigurator).identifier
                let view = collectionView.dequeueReusableFooterView(identifer: identifier, for: indexPath)
                footerConfigurator.configure(cell: view)
                return view
            }
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return viewModel
            .configurators[indexPath.section]
            .cellConfigurator[indexPath.row]
            .size(containerFrame: collectionView.frame)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return viewModel
            .configurators[section]
            .headerConfigurator?
            .size(containerFrame: collectionView.frame) ?? .zero
            
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return viewModel
            .configurators[section]
            .footerConfigurator?
            .size(containerFrame: collectionView.frame) ?? .zero
    }
}
