//
//  ExpandableFooterView.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/04.
//

import UIKit

class ExpandableFooterView: UIView {
    private let button: UIButton = {
        let button = UIButton()
        button.setTitle("Expand", for: .normal)
        button.setTitleColor(.darkGray, for: .normal)
        button.addTarget(self, action: #selector(expand), for: .touchUpInside)
        return button
    }()
    private var section: Int
    weak var delegate: ExpandableSectionDelegate?
    
    init(section: Int) {
        self.section = section
        super.init(frame: .zero)
        setSubViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setSubViews() {
        self.backgroundColor = .cyan
        self.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        button.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        button.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
    }
    
    @objc func expand() {
        delegate?.expand(section: section)
    }
}
