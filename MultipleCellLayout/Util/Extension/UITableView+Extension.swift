//
//  UITableView+Extension.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/04.
//

import UIKit

extension UITableView {
    func register<Cell: UITableViewCell>(type: Cell.Type) {
        let nib = UINib(nibName: type.identifier, bundle: nil)
        self.register(nib, forCellReuseIdentifier: type.identifier)
    }
    
    func register<Cell: UITableViewCell>(types: [Cell.Type]) {
        types.forEach { type in
            let nib = UINib(nibName: type.identifier, bundle: nil)
            self.register(nib, forCellReuseIdentifier: type.identifier)
        }
    }
    
    func dequeueReusableCell<Cell: UITableViewCell>(type: Cell.Type, for index: IndexPath) -> Cell {
        let cell =  self.dequeueReusableCell(withIdentifier: Cell.identifier, for: index) as? Cell ?? Cell()
        return cell
    }
}
