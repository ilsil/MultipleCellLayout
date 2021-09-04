//
//  NSObject+Extension.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/04.
//

import Foundation

extension NSObject {
    static var identifier: String {
        return String(describing: Self.self)
    }
}
