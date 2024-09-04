//
//  IncomesRouter.swift
//  MoneyFlow
//
//  Created by Brian Nahuel Borromeo Da Costa on 3/09/24.
//

import UIKit

protocol IncomesRouterProtocol {
    
}

final class IncomesRouter: IncomesRouterProtocol {
    
    var viewController: UIViewController!
    
    static func createModule() -> UIViewController {
        let viewController = IncomesViewController()
        let interactor = IncomesInteractor()
        let presenter = IncomesPresenter()
        let router = IncomesRouter()
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.router = router
        viewController.presenter = presenter
        router.viewController = viewController
        return viewController
    }
}
