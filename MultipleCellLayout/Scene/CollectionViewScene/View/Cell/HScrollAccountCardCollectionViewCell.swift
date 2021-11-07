//
//  HScrollAccountCardCollectionViewCell.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/08.
//

import UIKit

class HScrollAccountCardCollectionViewCell: UICollectionViewCell, ConfigurableCell {
    @IBOutlet weak var collectionView: UICollectionView!
    private var accounts: [Account] = []
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setCollectionView()
    }
    
    private func setCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(type: AccountCardCollectionViewCell.self)
    }
    
    func configure(data: AccountCellModel) {
        let diffList = data.accounts.difference(from: accounts)
        var reloadIndexPaths: [UICollectionView.ReloadMode] = []
        
        diffList.forEach {
            switch $0 {
            case .insert(offset: let offset, element: _, associatedWith: _):
                reloadIndexPaths.append(
                    .insert(
                        at: .init(row: offset, section: 0)
                    )
                )
            case .remove(offset: let offset, element: _, associatedWith: _):
                reloadIndexPaths.append(
                    .delete(at: .init(row: offset, section: 0)
                    )
                )
            }
        }
        
        collectionView.reload(at: reloadIndexPaths) {
            accounts = data.accounts
        }
    }
}

extension HScrollAccountCardCollectionViewCell: UICollectionViewDelegate {
    
}

extension HScrollAccountCardCollectionViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return accounts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(type: AccountCardCollectionViewCell.self, for: indexPath)
        cell.configure(data: accounts[indexPath.row])
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
