//
//  Array+Extension.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/11/12.
//

import Foundation

extension Array where Element: AnyObject {
    func index(at target: AnyObject) -> Int? {
        for (index, element) in enumerated() {
            if target === element {
                return index
            }
        }
        return nil
    }
}
