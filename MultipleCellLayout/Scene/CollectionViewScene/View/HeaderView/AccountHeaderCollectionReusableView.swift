//
//  AccountHeaderCollectionReusableView.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/08.
//

import UIKit

class AccountHeaderCollectionReusableView: UICollectionReusableView, ConfigurableReusableView {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(data: String) {
        titleLabel.text = data
    }
}
