//
//  GridCollectionViewCell.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/11.
//

import UIKit

class GridCollectionViewCell: UICollectionViewCell, ConfigurableCell {
    lazy var flowLayout: GridCollectionViewFlowLayout = {
        let layout = GridCollectionViewFlowLayout()
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isScrollEnabled = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setCollectionView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setCollectionView()
    }
    
    private var models: [String]? {
        didSet {
            collectionView.reloadData()
        }
    }
    
    private func setCollectionView() {
        contentView.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        collectionView.register(type: TileCollectionViewCell.self)
    }
    
    func configure(data: [String]) {
        self.models = data
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize) -> CGSize {
        layoutIfNeeded()
        let size = super.systemLayoutSizeFitting(targetSize)
        /// ContentSize의 높이를 리턴하여 Cell 전체 높이에 사용하도록 함
        return CGSize(width: size.width, height: collectionView.contentSize.height)
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


class GridCollectionViewFlowLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        
        var leftMargin = sectionInset.left
        var maxY:CGFloat = -1.0
        attributes?.forEach({ layoutAttribute in
            if layoutAttribute.representedElementCategory == .cell {
                if layoutAttribute.frame.origin.y >= maxY {
                    leftMargin = sectionInset.left
                }
                layoutAttribute.frame.origin.x = leftMargin
                leftMargin += layoutAttribute.frame.width + minimumInteritemSpacing
                maxY = max(layoutAttribute.frame.maxY, maxY)
            }
        })
        return attributes
    }
}
