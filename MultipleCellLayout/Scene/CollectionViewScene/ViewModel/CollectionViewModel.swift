//
//  CollectionViewModel.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/08.
//

import Foundation

class CollectionViewModel: ConfiguratorViewModelType {
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
            AccountSectionConfigurator(
                cellConfigurator: [config],
                headerConfigurator: headerConfig
            )
        )
        
        let tileConfig: [CellConfigurator] = [
            TileCellConfigurator(item:"AAA@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"),
            TileImageCellConfigurator(item:"BBB"),
            TileCellConfigurator(item:"CCC"),
            TileImageCellConfigurator(item:"DDD"),
            TileCellConfigurator(item:"EEE"),
            TileCellConfigurator(item:"AAA@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"),
            TileImageCellConfigurator(item:"BBB"),
            TileImageCellConfigurator(item:"CCC"),
            TileCellConfigurator(item:"DDD"),
            TileCellConfigurator(item:"EEE")
        ]
        
        configurators.append(
            TileSectionConfigurator(
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
        configurators.append(GridSectionConfigurator(cellConfigurator: [gridConfig]))
    }
}
