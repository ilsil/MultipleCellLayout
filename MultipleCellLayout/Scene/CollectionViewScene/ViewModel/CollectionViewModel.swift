//
//  CollectionViewModel.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/08.
//

import Foundation

class CollectionViewModel: ConfiguratorViewModelType {
    weak var delegate: ReloadSectionConfiguratorDelegate?
    var configurators: [SectionConfigurator] = []
    
    init() {
        setTempData()
    }
    
    private func setTempData() {
        let config = HScrollAccountCardCellConfigurator.init(item: [
            AccountModel(account: "110-100", money: "2,000"),
            AccountModel(account: "210-100", money: "5,000"),
            AccountModel(account: "310-100", money: "12,000")
        ])
        let headerConfig = TitleHeaderReusableViewConfigurator(item: "Header Title")
        configurators.append(
            SectionConfigurator(
                cellConfigurator: [config],
                headerConfigurator: headerConfig
            )
        )
        
        let expandTileConfig: [CellConfigurator] = [
            TileImageFullWidthCellConfigurator(item:"AAA@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"),
            TileImageFullWidthCellConfigurator(item:"BBB"),
            TileImageFullWidthCellConfigurator(item:"AAA@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"),
            TileImageFullWidthCellConfigurator(item:"BBB"),
            TileImageFullWidthCellConfigurator(item:"AAA@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"),
            TileImageFullWidthCellConfigurator(item:"BBB"),
            TileImageFullWidthCellConfigurator(item:"AAA@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"),
            TileImageFullWidthCellConfigurator(item:"BBB@@")
        ]
        
        let expandableFooterConfigurator = ExpandableFooterReusableViewConfigurator(
            item: ExpandableModel(
                section: configurators.count
            )
        )
        expandableFooterConfigurator.delegate = self
        
        configurators.append(
            ExpandableSectionConfigurator(
                cellConfigurator: expandTileConfig,
                footerConfigurator: expandableFooterConfigurator,
                initialRowCount: 3
            )
        )
        
        let tileConfig: [CellConfigurator] = [
            TileCellConfigurator(item:"AAA@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"),
            TileImageHalfWidthCellConfigurator(item:"BBB"),
            TileCellConfigurator(item:"CCC"),
            TileImageHalfWidthCellConfigurator(item:"DDD"),
            TileCellConfigurator(item:"EEE"),
            TileCellConfigurator(item:"AAA@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"),
            TileImageHalfWidthCellConfigurator(item:"BBB"),
            TileImageHalfWidthCellConfigurator(item:"CCC"),
            TileCellConfigurator(item:"DDD"),
            TileCellConfigurator(item:"EEE")
        ]
        
        configurators.append(
            SectionConfigurator(
                cellConfigurator: tileConfig
            )
        )
        
        let gridConfig = GridCellConfigurator(item: [
            "11",
            "2222",
            "33",
            "44444",
            "5555",
            "666",
            "777",
            "8",
            "9999",
            "44444",
            "5555",
            "666",
            "777",
            "8",
            "9999"
        ])
        configurators.append(SectionConfigurator(cellConfigurator: [gridConfig]))
    }
}

extension CollectionViewModel: ExpandableSectionConfiguratorDelegate {
    func expand(section: Int) {
        if let expandableSection = configurators[section] as? ExpandableSectionConfigurator {
            expandableSection.isExpandable.toggle()
            delegate?.reload(section: section)
        }
    }
}
