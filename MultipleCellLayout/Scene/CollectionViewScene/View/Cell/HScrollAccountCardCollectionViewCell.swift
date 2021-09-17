//
//  HScrollAccountCardCollectionViewCell.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/08.
//

import UIKit

class HScrollAccountCardCollectionViewCell: UICollectionViewCell, ConfigurableCell {
    @IBOutlet weak var collectionView: UICollectionView!
    private var accountList: [AccountModel]? {
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
        collectionView.register(type: AccountCardCollectionViewCell.self)
    }
    
    func configure(data: [AccountModel]) {
        accountList = data
    }
}

extension HScrollAccountCardCollectionViewCell: UICollectionViewDelegate {
    
}

extension HScrollAccountCardCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return accountList?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(type: AccountCardCollectionViewCell.self, for: indexPath)
        if let model = accountList?[indexPath.row] {
            cell.configure(data: model)
        }
        return cell
    }
}

extension HScrollAccountCardCollectionViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width-20, height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
}
