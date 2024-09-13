//
//  ConfigurationPresenter.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 3/09/24.
//

protocol ConfigurationPresenterProtocol {
    var configurationTitles: [String] { get }
}

final class ConfigurationPresenter: ConfigurationPresenterProtocol {
    weak var view: ConfigurationView!
    var interactor: ConfigurationInteractorProtocol!
    var router: ConfigurationRouterProtocol!
    
    var configurationTitles: [String] = ["Moneda"]
}
