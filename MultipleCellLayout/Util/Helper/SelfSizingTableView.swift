//
//  SelfSizingTableView.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/04.
//

import UIKit

class SelfSizingTableView: UITableView {
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
//        self.layoutIfNeeded()
    }

    override var intrinsicContentSize: CGSize {
        return contentSize
    }
}
