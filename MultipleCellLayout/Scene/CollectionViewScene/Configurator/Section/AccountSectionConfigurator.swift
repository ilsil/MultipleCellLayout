//
//  AccountSectionConfigurator.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/15.
//

import UIKit

class AccountSectionConfigurator: SectionConfigurator,
                                  ConfiguratorRegisterable {
    static func register(collectionView: UICollectionView) {
        collectionView.register(
            identifier: HScrollAccountCardCellConfigurator.identifier
        )
        collectionView.registerHeaderView(
            identifier: TitleHeaderReusableViewConfigurator.identifier
        )
    }
}
