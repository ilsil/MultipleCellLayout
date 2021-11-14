//
//  ExpandableSectionConfigurator.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/11/14.
//

import Foundation

protocol ExpandableSectionConfiguratorDelegate: class {
    func expand(section: Int)
}

class ExpandableSectionConfigurator: SectionConfigurator, Expandable {
    private let initialRowCount: Int
    
    var defaultRowCount: Int {
        get {
            return initialRowCount
        }
    }
    
    var expandedRowCount: Int {
        get {
            let totalCellCount = cellConfigurator.count
            return totalCellCount > defaultRowCount ? totalCellCount : defaultRowCount
        }
    }
    
    var isExpandable: Bool = false {
        didSet {
            if var expandable = headerConfigurator as? Expandable {
                expandable.isExpandable.toggle()
            } else if var expandable = footerConfigurator as? Expandable {
                expandable.isExpandable.toggle()
            }
        }
    }
    
    init(
        cellConfigurator: [CellConfigurator] = [],
        headerConfigurator: ReusableViewConfigurator? = nil,
        footerConfigurator: ReusableViewConfigurator? = nil,
        initialRowCount: Int
    ) {
        self.initialRowCount = initialRowCount
        super.init(
            cellConfigurator: cellConfigurator,
            headerConfigurator: headerConfigurator,
            footerConfigurator: footerConfigurator
        )
    }
    
    override func rowCount() -> Int {
        let expandedRowCount = super.rowCount()
        if isExpandable {
            return expandedRowCount
        } else {
            let rowCount = expandedRowCount > initialRowCount ? initialRowCount : expandedRowCount
            return rowCount
        }
    }
    
    override func updateCellConfigurators(
        section: Int,
        newValue newCellConfigurators: [CellConfigurator]
    ) -> [UpdateMode] {
        let oldList: [CellConfigurator]
        let newList: [CellConfigurator]
        if isExpandable {
            oldList = cellConfigurator
            newList = newCellConfigurators
        } else {
            /// 화면에 노출될 초기 갯수보다 데이터 수가 적은 경우 대응
            let oldMinOffset = defaultRowCount>cellConfigurator.count ? cellConfigurator.count : defaultRowCount
            let newMinOffset = defaultRowCount>newCellConfigurators.count ? newCellConfigurators.count : defaultRowCount
            
            oldList = Array(cellConfigurator[0..<oldMinOffset])
            newList = Array(newCellConfigurators[0..<newMinOffset])
        }
        let list = updateModes(
            section: section,
            from: oldList,
            to: newList
        )
        cellConfigurator = newCellConfigurators
        return list
    }
}
