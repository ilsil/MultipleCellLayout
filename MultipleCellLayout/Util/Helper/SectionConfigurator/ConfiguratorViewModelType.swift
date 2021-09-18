//
//  ConfiguratorViewModelType.swift
//  MultipleCellLayout
//
//  Created by SeokSoo on 2021/09/17.
//

import Foundation

protocol ConfiguratorViewModelType: class {
    var configurators: [SectionConfigurator] { get }
    var delegate: ReloadSectionConfiguratorDelegate? { get set }
}
