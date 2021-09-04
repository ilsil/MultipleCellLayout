//
//  SectionType.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/04.
//

import Foundation

protocol SectionType {
    associatedtype CellModel
    /// Section 안의 Cell 수
    var rowCount: Int { get }
    /// 화면에 표현되는 Cell 데이터 리스트
    var displayCellModels: [CellModel] { get }
}

extension SectionType {
    var rowCount: Int {
        return displayCellModels.count
    }
}

protocol Expandable {
    var isExpandable: Bool { get set }
}

protocol ExpandableSectionType: SectionType, Expandable {
    /// 확장하기 전의 Cell 수를 지정
    var initialCount: Int { get }
    /// Section의 모든 Cell 데이터를 담고 있는 변수
    var totalModels: [CellModel] { get }
}

extension ExpandableSectionType {
    var displayCellModels: [CellModel] {
        if isExpandable {
            return totalModels
        } else {
            if totalModels.count <= initialCount {
                return totalModels
            } else {
                return Array(totalModels[0..<initialCount])
            }
        }
    }
}
