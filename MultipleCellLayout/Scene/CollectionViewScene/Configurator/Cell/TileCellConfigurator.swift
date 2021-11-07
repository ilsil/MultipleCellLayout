//
//  TileCellConfigurator.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/17.
//

import UIKit

class TileCellConfigurator: CollectionViewCellConfigurator<TileCollectionViewCell, TileCellModel> {
    override func size(containerFrame: CGRect) -> CGSize {
        return CGSize(width: containerFrame.width/2, height: 50)
    }
}
