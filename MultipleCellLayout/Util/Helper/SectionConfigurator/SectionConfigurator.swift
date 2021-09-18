//
//  SectionConfigurator.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/15.
//

import UIKit

protocol Expandable {
    var isExpandable: Bool { get set }
}

protocol ConfiguratorRegisterable {
    static func register(collectionView: UICollectionView)
}

protocol SectionConfigurable {
    var cellConfigurator: [CellConfigurator] { get set }
    var headerConfigurator: ReusableViewConfigurator? { get }
    var footerConfigurator: ReusableViewConfigurator? { get }
    
    func rowCount() -> Int
}

class SectionConfigurator: SectionConfigurable {
    var cellConfigurator: [CellConfigurator] = []
    var headerConfigurator: ReusableViewConfigurator?
    var footerConfigurator: ReusableViewConfigurator?
    
    init(
        cellConfigurator: [CellConfigurator],
        headerConfigurator: ReusableViewConfigurator? = nil,
        footerConfigurator: ReusableViewConfigurator? = nil
         ) {
        self.cellConfigurator = cellConfigurator
        self.headerConfigurator = headerConfigurator
        self.footerConfigurator = footerConfigurator
    }
    
    func rowCount() -> Int {
        return cellConfigurator.count
    }
}

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
        cellConfigurator: [CellConfigurator],
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
}
