//
//  CollectionConfigurator.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/08.
//

import UIKit

typealias UpdateSectionCellModelClosure = ()->Void
protocol ReloadSectionConfiguratorDelegate: class {
    func reload(sections: IndexSet)
    func reload(section: Int, newCellConfigurators: [CellConfigurator])
}

class CollectionConfigurator {
    private weak var collectionView: UICollectionView?
    private weak var viewModel: ConfiguratorViewModelType?
    
    init(
        viewModel: ConfiguratorViewModelType,
        collectionView: UICollectionView
    ) {
        self.collectionView = collectionView
        self.viewModel = viewModel
        viewModel.delegate = self
        register()
    }
    
    private func register() {
        guard let collectionView = collectionView else { return }
        //TODO: cell register와 ViewModel의 실제 데이터와 구조적으로 엮는 부분이 필요
        collectionView.register(
            identifier: HScrollAccountCardCellConfigurator.identifier
        )
        collectionView.register(identifier: TileCellConfigurator.identifier)
        collectionView.register(identifier: TileImageHalfWidthCellConfigurator.identifier)
        collectionView.register(identifier: GridCellConfigurator.identifier)
        collectionView.registerHeaderView(
            identifier: TitleHeaderReusableViewConfigurator.identifier
        )
        collectionView.registerFooterView(
            identifier: ExpandableImageCollectionReusableView.identifier
        )
    }
    
    var numberOfSections: Int {
        return viewModel?.configurators.count ?? 0
    }
    
    func numberOfItemsInSection(section: Int) -> Int {
        return viewModel?.configurators[section].rowCount() ?? 0
    }
    
    func dequeueReuseCell(cellForRowAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let viewModel = viewModel,
              let collectionView = collectionView else { return UICollectionViewCell() }
        let item = viewModel.configurators[indexPath.section]
        let cellConfigurator = item.cellConfigurator[indexPath.row]
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: type(of:cellConfigurator).identifier, for: indexPath
        )
        item.cellConfigurator[indexPath.row].configure(cell: cell)
        return cell
    }
    
    func dequeueReusableView(
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        guard let viewModel = viewModel,
              let collectionView = collectionView else { return UICollectionReusableView() }
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
    
    func cellSize(at indexPath: IndexPath) -> CGSize {
        guard let viewModel = viewModel,
              let collectionView = collectionView else { return .zero }
        return viewModel
            .configurators[indexPath.section]
            .cellConfigurator[indexPath.row]
            .size(containerFrame: collectionView.frame)
    }

    func headerSize(section: Int) -> CGSize {
        guard let viewModel = viewModel,
              let collectionView = collectionView else { return .zero }
        return viewModel
            .configurators[section]
            .headerConfigurator?
            .size(containerFrame: collectionView.frame) ?? .zero
    }

    func footerSize(section: Int) -> CGSize {
        guard let viewModel = viewModel,
              let collectionView = collectionView else { return .zero }
        return viewModel
            .configurators[section]
            .footerConfigurator?
            .size(containerFrame: collectionView.frame) ?? .zero
    }
}

extension CollectionConfigurator: ReloadSectionConfiguratorDelegate {
    func reload(sections: IndexSet) {
        guard let collectionView = collectionView else { return }
        DispatchQueue.main.async {
            collectionView.reloadSections(sections)
        }
    }
    
    func reload(section: Int, newCellConfigurators: [CellConfigurator]) {
        guard let viewModel = viewModel,
              let collectionView = collectionView else { return }
        let sectionConfigurator = viewModel.configurators[section]
        var insertIndexPaths: [IndexPath] = []
        var deleteIndexPaths: [IndexPath] = []
        
        DispatchQueue.main.async {
            collectionView.performBatchUpdates({
                let diffList = sectionConfigurator.updateCellConfigurators(
                    section: section,
                    newValue: newCellConfigurators
                )
                diffList.forEach {
                    switch $0 {
                    case .insert(let indexPath):
                        insertIndexPaths.append(indexPath)
                    case .delete(let indexPath):
                        deleteIndexPaths.append(indexPath)
                    }
                }
                collectionView.deleteItems(at: deleteIndexPaths)
                collectionView.insertItems(at: insertIndexPaths)
            }, completion: nil)
        }
    }
}
