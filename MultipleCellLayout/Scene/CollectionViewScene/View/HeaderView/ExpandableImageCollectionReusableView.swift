//
//  ExpandableImageCollectionReusableView.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/18.
//

import UIKit

class ExpandableImageCollectionReusableView: UICollectionReusableView,
                                             ConfigurableReusableView {
    @IBOutlet weak var expandableButton: UIButton!
    
    weak var delegate: ExpandableSectionConfiguratorDelegate?
    var isExpandable: Bool = false {
        didSet {
            expandableButton.isSelected = isExpandable
        }
    }
    private var model: ExpandableModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = .cyan
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        delegate = nil
    }
    
    @IBAction func clickExpandableButton(_ sender: Any) {
        guard let section = model?.section else { return }
        expandableButton.isSelected.toggle()
        delegate?.expand(section: section)
    }
    
    func configure(data: ExpandableModel) {
        model = data
    }
}

