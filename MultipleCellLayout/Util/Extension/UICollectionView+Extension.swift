//
//  UICollectionView+Extension.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/08.
//

import UIKit

extension UICollectionView {
    func register<Cell: UICollectionViewCell>(type: Cell.Type) {
        let nib = UINib(nibName: type.identifier, bundle: nil)
        self.register(nib, forCellWithReuseIdentifier: type.identifier)
    }
    
    func register<View: UICollectionReusableView>(type: View.Type, kind: String) {
        let nib = UINib(nibName: type.identifier, bundle: nil)
        self.register(nib, forSupplementaryViewOfKind: kind, withReuseIdentifier: type.identifier)
    }
    
    func registerHeaderView<View: UICollectionReusableView>(type: View.Type) {
        self.register(type: type, kind: UICollectionView.elementKindSectionHeader)
    }
    
    func registerFooterView<View: UICollectionReusableView>(type: View.Type) {
        self.register(type: type, kind: UICollectionView.elementKindSectionFooter)
    }
    
    func dequeueReusableCell<Cell: UICollectionViewCell>(type: Cell.Type, for index: IndexPath) -> Cell {
        let cell =  self.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: index) as? Cell ?? Cell()
        return cell
    }
    
    func dequeueReusableView<View: UICollectionReusableView>(type: View.Type, kind: String, for indexPath: IndexPath) -> View {
        let view = self.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: View.identifier, for: indexPath) as? View ?? View()
        return view
    }
    
    func dequeReusableHeaderView<View: UICollectionReusableView>(type: View.Type, for indexPath: IndexPath) -> View {
        let view = self.dequeueReusableView(type: type, kind: UICollectionView.elementKindSectionHeader, for: indexPath)
        return view
    }
    
    func dequeReusableFooterView<View: UICollectionReusableView>(type: View.Type, for indexPath: IndexPath) -> View {
        let view = self.dequeueReusableView(type: type, kind: UICollectionView.elementKindSectionFooter, for: indexPath)
        return view
    }
}
