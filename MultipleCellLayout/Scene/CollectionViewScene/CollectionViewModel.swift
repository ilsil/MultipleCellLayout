//
//  CollectionViewModel.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/08.
//

import Foundation

class CollectionViewModel {
    var configurators: [SectionConfigurator] = []
    
    init() {
        setTempData()
    }
    
    private func setTempData() {
        let config = AccountCellConfig.init(item: [
            AccountModel(account: "110-100", money: "2,000"),
            AccountModel(account: "210-100", money: "5,000"),
            AccountModel(account: "310-100", money: "12,000")
        ])
        let headerConfig = AccountHeaderConfig(item: "Header Title")
        configurators.append(AccountSectionConfigurator(cellConfigurator: [config], headerConfigurator: headerConfig))
        
        let tileConfig = [
            TileCellConfig(item:"AAA@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"),
            TileCellConfig(item:"BBB"),
            TileCellConfig(item:"CCC"),
            TileCellConfig(item:"DDD"),
            TileCellConfig(item:"EEE"),
            TileCellConfig(item:"AAA@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"),
            TileCellConfig(item:"BBB"),
            TileCellConfig(item:"CCC"),
            TileCellConfig(item:"DDD"),
            TileCellConfig(item:"EEE")
        ]
        configurators.append(TileSectionConfigurator(cellConfigurator: tileConfig))
        
//        let gridConfig = GridCellConfig(item: [
//            "11",
//            "2222",
//            "33",
//            "44444",
//            "5555",
//            "666",
//            "777",
//            "8",
//            "9999"
//        ])
//        configurator.append(GridSectionConfigurator(cellConfigurator: [gridConfig]))
    }
}
