//
//  GridCollectionViewCell.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/11.
//

import UIKit

class GridCollectionViewCell: UICollectionViewCell, ConfigurableCell {
    var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero)
        return collectionView
    }()
    
    private var models: [String]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCollectionView()
    }
    
    private func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(type: TileCollectionViewCell.self)
    }
    
    func configure(data: [String]) {
        self.models = data
    }
}

extension GridCollectionViewCell: UICollectionViewDelegate {
    
}

extension GridCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return models?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(type: TileCollectionViewCell.self, for: indexPath)
        if let model = models?[indexPath.row] {
            cell.configure(data: model)
        }
        return cell
    }
}
