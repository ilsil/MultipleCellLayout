//
//  ExpandableFooterReusableViewConfigurator.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/18.
//

import UIKit

class ExpandableFooterReusableViewConfigurator: CollectionReusableViewConfigurator<ExpandableImageCollectionReusableView, ExpandableModel>, Expandable {
    var isExpandable: Bool = false
    weak var delegate: ExpandableSectionConfiguratorDelegate?
    
    override func configure(cell: UICollectionReusableView) {
        if let expandableCell = cell as? ExpandableImageCollectionReusableView {
            expandableCell.delegate = delegate
            expandableCell.isExpandable = isExpandable
        }
        super.configure(cell: cell)
    }
    
    override func size(containerFrame: CGRect) -> CGSize {
        return CGSize(width: containerFrame.width, height: 50)
    }
}



