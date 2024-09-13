//
//  ConfigurationRouter.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 3/09/24.
//

import UIKit

protocol ConfigurationRouterProtocol {
    
}

final class ConfigurationRouter: ConfigurationRouterProtocol {
    var viewController: UIViewController!
    
    static func createModule() -> UIViewController {
        let viewController = ConfigurationViewController()
        let interactor = ConfigurationInteractor()
        let presenter = ConfigurationPresenter()
        let router = ConfigurationRouter()
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        viewController.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
