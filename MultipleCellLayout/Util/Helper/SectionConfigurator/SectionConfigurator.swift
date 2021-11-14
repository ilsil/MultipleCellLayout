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
    /// CellConfigurator 업데이트 및 변경리스트(insert, delete) 리턴
    func updateCellConfigurators(
        section: Int,
        newValue newCellConfigurators: [CellConfigurator]
    ) -> [UpdateMode]
}

enum UpdateMode {
    case insert(IndexPath)
    case delete(IndexPath)
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
    
    func updateCellConfigurators(
        section: Int,
        newValue newCellConfigurators: [CellConfigurator]
    ) -> [UpdateMode] {
        let list = updateModes(
            section: section,
            from: cellConfigurator,
            to: newCellConfigurators
        )
        cellConfigurator = newCellConfigurators
        return list
    }
}

extension SectionConfigurator {
    func updateModes(
        section: Int,
        from oldValue: [CellConfigurator],
        to newValue: [CellConfigurator]
    ) -> [UpdateMode] {
        var updateModes: [UpdateMode] = []
        let oldList = oldValue.map { $0.uuid }
        let newList = newValue.map { $0.uuid }
        let diffList = newList.difference(from: oldList)
        diffList.forEach {
            switch $0 {
            case .insert(offset: let offset, element: _, associatedWith: _):
                updateModes.append(
                    .insert(
                        .init(row: offset, section: section)
                    )
                )
            case .remove(offset: let offset, element: _, associatedWith: _):
                updateModes.append(
                    .delete(
                        .init(row: offset, section: section)
                    )
                )
            }
        }
        return updateModes
    }
}
