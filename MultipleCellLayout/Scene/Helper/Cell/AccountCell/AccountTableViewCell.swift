//
//  AccountTableViewCell.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/04.
//

import UIKit

class AccountTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setModel(model: AccountModel) {
        titleLabel.text = "\(model.account): $\(model.money)"
    }
}
