//
//  CollectionViewController.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/08.
//

import UIKit

class CollectionViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    private let viewModel = CollectionViewModel()
    private var factory: CollectionViewFactory!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setFactory()
    }
    
    private func setFactory() {
        factory = CollectionViewFactory(viewModel: viewModel)
        factory.registerCells(on: collectionView)
    }
}

extension CollectionViewController: UICollectionViewDelegate {
    
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return factory.rowCount(at: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return factory.dequeueReuseCell(collectionView: collectionView, cellForRowAt: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        return factory.reusableView(collectionView: collectionView, kind: kind, indexPath: indexPath)
    }
}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return factory.cellSize(collectionView: collectionView, indexPath: indexPath)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return factory.headerViewSize(collectionView: collectionView, section: section)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return factory.footerViewSize(collectionView: collectionView, section: section)
    }
}