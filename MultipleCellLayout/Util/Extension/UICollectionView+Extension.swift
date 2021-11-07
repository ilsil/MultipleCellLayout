//
//  UICollectionView+Extension.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/08.
//

import UIKit

extension UICollectionView {
    func register(identifier: String) {
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: identifier)
    }
    
    func register<Cell: UICollectionViewCell>(type: Cell.Type) {
        self.register(identifier: type.identifier)
    }
    
    func register(identifier: String, kind: String) {
        let nib = UINib(nibName: identifier, bundle: nil)
        self.register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: identifier)
    }
    
    func register<View: UICollectionReusableView>(type: View.Type, kind: String) {
        self.register(identifier: type.identifier, kind: kind)
    }
    
    func registerHeaderView(identifier: String) {
        self.register(identifier: identifier, kind: UICollectionView.elementKindSectionHeader)
    }
    
    func registerFooterView(identifier: String) {
        self.register(identifier: identifier, kind: UICollectionView.elementKindSectionFooter)
    }
    
    func registerHeaderView<View: UICollectionReusableView>(type: View.Type) {
        self.register(type: type, kind: UICollectionView.elementKindSectionHeader)
    }
    
    func registerFooterView<View: UICollectionReusableView>(type: View.Type) {
        self.register(type: type, kind: UICollectionView.elementKindSectionFooter)
    }
    
    func dequeueReusableCell<Cell: UICollectionViewCell>(type: Cell.Type, for index: IndexPath) -> Cell {
        let cell = self.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: index) as? Cell ?? Cell()
        return cell
    }
    
    func dequeueReusableView<View: UICollectionReusableView>(type: View.Type, kind: String, for indexPath: IndexPath) -> View {
        let view = self.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: View.identifier, for: indexPath) as? View ?? View()
        return view
    }
    
    func dequeueReusableHeaderView(identifer: String, for indexPath: IndexPath) -> UICollectionReusableView {
        let view = self.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: identifer,
            for: indexPath)
        return view
    }
    
    func dequeueReusableFooterView(identifer: String, for indexPath: IndexPath) -> UICollectionReusableView {
        let view = self.dequeueReusableSupplementaryView(
            ofKind: UICollectionView.elementKindSectionFooter,
            withReuseIdentifier: identifer,
            for: indexPath)
        return view
    }
    
    func dequeueReusableHeaderView<View: UICollectionReusableView>(type: View.Type, for indexPath: IndexPath) -> View {
        let view = self.dequeueReusableView(type: type, kind: UICollectionView.elementKindSectionHeader, for: indexPath)
        return view
    }
    
    func dequeueReusableFooterView<View: UICollectionReusableView>(type: View.Type, for indexPath: IndexPath) -> View {
        let view = self.dequeueReusableView(type: type, kind: UICollectionView.elementKindSectionFooter, for: indexPath)
        return view
    }
    
    enum ReloadMode {
        case insert(at: IndexPath)
        case delete(at: IndexPath)
        case move(from: IndexPath, to: IndexPath)
    }
    
    /// CollectionView 업데이트
    /// - Parameters:
    ///   - target: 변경 방식과 해당 모델의 IndexPath
    ///   - updateModel: CollectionView의 data Model 업데이트 클로저
    ///   - completion: 완료 후 콜백처리
    func reload(
        at target: [ReloadMode],
        updateModel : () -> Void,
        completion: ((Bool) -> Void)? = nil
    ) {
        var deleteIndexPaths: [IndexPath] = []
        var insertIndexPaths: [IndexPath] = []
        var moveIndexPaths: [(IndexPath, IndexPath)] = []
        
        target.forEach {
            switch $0 {
            case .insert(at: let indexPath):
                insertIndexPaths.append(indexPath)
            case .delete(at: let indexPath):
                deleteIndexPaths.append(indexPath)
            case .move(from: let fromIndex, to: let toIndex):
                moveIndexPaths.append((fromIndex, toIndex))
            }
        }
        
        performBatchUpdates {
            /// performBatchUpdates를 사용할 때 주의
            /// collectionView의 dataModel 업데이트를 update 클로저 내부에서 실행시켜야 함!
            updateModel()
            deleteItems(at: deleteIndexPaths)
            insertItems(at: insertIndexPaths)
            moveIndexPaths.forEach {
                moveItem(at: $0, to: $1)
            }
        } completion: {
            completion?($0)
        }
    }
}
