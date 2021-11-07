//
//  HScrollAccountCardCellConfigurator.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/17.
//

import UIKit

class HScrollAccountCardCellConfigurator: CollectionViewCellConfigurator<HScrollAccountCardCollectionViewCell, AccountCellModel> {
    override func size(containerFrame: CGRect) -> CGSize {
        return CGSize(width: containerFrame.width, height: 300)
    }
}
