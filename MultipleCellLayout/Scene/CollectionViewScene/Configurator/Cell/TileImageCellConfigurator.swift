//
//  TileImageCellConfigurator.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/17.
//

import UIKit

class TileImageCellConfigurator: CollectionViewCellConfigurator<TileImageCollectionViewCell, String> {
    override func size(containerFrame: CGRect) -> CGSize {
        return CGSize(width: containerFrame.width/2, height: 50)
    }
}
