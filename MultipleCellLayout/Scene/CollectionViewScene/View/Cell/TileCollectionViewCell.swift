//
//  TileCollectionViewCell.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/11.
//

import UIKit

class TileCollectionViewCell: UICollectionViewCell, ConfigurableCell {
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setContentsView()
    }
    
    private func setContentsView() {
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .red
    }
    
    func configure(data: TileCellModel) {
        titleLabel.text = data.title
    }
}
