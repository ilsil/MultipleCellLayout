//
//  AccountCardCollectionViewCell.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/08.
//

import UIKit

class AccountCardCollectionViewCell: UICollectionViewCell, ConfigurableCell {
    @IBOutlet weak var bankLogoView: UIView!
    @IBOutlet weak var accountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = .red
        setBankLogoView()
    }
    
    private func setBankLogoView() {
        bankLogoView.layer.cornerRadius = 5
        bankLogoView.backgroundColor = .cyan
    }
    
    func configure(data: Account) {
        accountLabel.text = "\(data.accountNumber): $\(data.money)"
    }
}
